class Name {
  num count;
  String name;
  num age;
  String countryId;

  Name({required this.count, required this.name, required this.age, required this.countryId});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
        count: json['count'] ?? 0, name: json['name'] ?? '', age: json['age'] ?? 0, countryId: json['countryId'] ?? '');
  }

  toJson() {
    return {'count': count, 'name': name, 'age': age};
  }
}
