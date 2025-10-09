// Patient model class
class Patient {
  final String id;
  final String name;
  final String email;
  final String phone;
  final DateTime dateOfBirth;

  Patient({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.dateOfBirth,
  });

  int get age {
    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'dateOfBirth': dateOfBirth.toIso8601String(),
    };
  }

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
    );
  }
}
