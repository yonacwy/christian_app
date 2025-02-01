import 'package:hive_ce/hive.dart';
import '../models/my_model.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<MyModel>()])
// Annotations must be on some element
// ignore: unused_element
void _() {}