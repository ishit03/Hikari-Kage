class Character {
  Character({this.firstName, this.lastName, this.pictureUri, this.role});

  factory Character.fromJson(Map<String, dynamic> jsonData) => Character(
      firstName: (jsonData['node'] as Map)['first_name'] as String,
      lastName: (jsonData['node'] as Map)['last_name'] as String,
      role: jsonData['role'] as String,
      pictureUri: ((jsonData['node'] as Map<String, dynamic>)
              .containsKey('main_picture'))
          ? ((jsonData['node'] as Map)['main_picture'] as Map)['medium']
              as String
          : null);

  late final String? firstName;
  late final String? lastName;
  late final String? pictureUri;
  late final String? role;

  @override
  String toString() {
    return 'Character{firstName: $firstName, lastName: $lastName, pictureUri: $pictureUri, role: $role}';
  }
}
