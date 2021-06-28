
class CustomUser {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String state;
  String university;
  String level;
  String gender;
  final String avatar;
  final int age;
  final String ethnicity;

  CustomUser({
    this.id: '',
    required this.firstName,
    required this.lastName,
    required this.email,
    this.state: '',
    this.university: '',
    this.level: '',
    this.gender: '',
    this.age: 0,
    this.ethnicity: '',
    this.avatar: ''
  });

  CustomUser.fromData(Map<String, dynamic>? data)
    : id = data!['id'], firstName = data['firstName'],
      lastName = data['lastName'], email = data['email'],
      state = data['state'], university = data['university'], 
      level = data['level'], gender = data['gender'], 
      age = data['age'], ethnicity = data['ethnicity'], avatar = data['avatar'];

  Map<String, dynamic>toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'state': state,
      'university': university,
      'level': level,
      'gender': gender,
      'age': age,
      'ethnicity': ethnicity,
      'avatar': avatar
    };
  }
}