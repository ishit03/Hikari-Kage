class Character {
  late final String? firstName;
  late final String? lastName;
  late final String? pictureUri;
  late final String? role;

  Character({this.firstName, this.lastName, this.pictureUri, this.role});

  factory Character.fromJson(Map<String, dynamic> jsonData) => Character(
      firstName: jsonData['node']['first_name'],
      lastName: jsonData['node']['last_name'],
      role: jsonData['role'],
      pictureUri: (jsonData['node'].containsKey('main_picture'))
          ? jsonData['node']['main_picture']['medium']
          : null);

  @override
  String toString() {
    return 'Character{firstName: $firstName, lastName: $lastName, pictureUri: $pictureUri, role: $role}';
  }
}
