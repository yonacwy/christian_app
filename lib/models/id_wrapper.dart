
class IdWrapper {
  final int id;

  IdWrapper(this.id);

  Map<String, dynamic> toJson() => {
    'id': id,
  };

  factory IdWrapper.fromJson(Map<String, dynamic> json) => IdWrapper(
    json['id'] as int,
  );
}