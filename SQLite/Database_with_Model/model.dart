class Model {
  int? id;
  String name;
  int age;
  String address;

  Model(
      {required this.age, required this.name, required this.address, this.id});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': age, 'address': address};
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(age: map['age'], name: map['name'], address: map['address']);
  }
}
