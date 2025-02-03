import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:crypt/crypt.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _currentEmailController = TextEditingController();
  final _currentUsernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final userBox = Hive.box('user');
    final userModel = userBox.get('user');
    if (userModel != null) {
      _emailController.text = userModel.email ?? '';
      _usernameController.text = userModel.name ?? '';
      _currentEmailController.text = userModel.email ?? '';
      _currentUsernameController.text = userModel.name ?? '';
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _currentEmailController.dispose();
    _currentUsernameController.dispose();
    super.dispose();
  }

  Future<void> _updateEmail() async {
    if (_formKey.currentState!.validate()) {
      try {
        final userBox = Hive.box('user');
        final userModel = userBox.get('user');
        if (userModel != null) {
          userModel.email = _emailController.text;
          userBox.put('user', userModel);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email updated')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating email: $e')),
        );
      }
    }
  }

  Future<void> _updateUsername() async {
    if (_formKey.currentState!.validate()) {
      try {
        final userBox = Hive.box('user');
        final userModel = userBox.get('user');
        if (userModel != null) {
          userModel.name = _usernameController.text;
          userBox.put('user', userModel);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Username updated')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating username: $e')),
        );
      }
    }
  }

  String _generateSalt() {
    final random = DateTime.now().microsecondsSinceEpoch.toString();
    return random;
  }

  Future<void> _updatePassword() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text.isNotEmpty) {
        try {
          final userBox = Hive.box('user');
          final salt = _generateSalt();
          final hash = Crypt.sha256(_passwordController.text, salt: salt).toString();
          final userModel = userBox.get('user');
          if (userModel != null) {
            userModel.password = hash;
            userBox.put('user', userModel);
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password updated')),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error updating password: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Fix account_page to display user info
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Current User Info',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  _currentEmailController.text,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                  _currentUsernameController.text,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Update User Info',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: _updateEmail,
                  child: const Text('Update Email'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: _updateUsername,
                  child: const Text('Update Username'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'New Password (optional)',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: _updatePassword,
                  child: const Text('Update Password'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}