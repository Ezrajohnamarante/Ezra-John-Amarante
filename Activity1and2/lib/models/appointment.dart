// Appointment model class
class Appointment {
  final String id;
  final String patientName;
  final DateTime time;
  final String service;

  Appointment({
    required this.id,
    required this.patientName,
    required this.time,
    required this.service,
  });

  String get formattedTime {
    final hour = time.hour > 12 ? time.hour - 12 : time.hour;
    final period = time.hour >= 12 ? 'PM' : 'AM';
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientName': patientName,
      'time': time.toIso8601String(),
      'service': service,
    };
  }

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      patientName: json['patientName'],
      time: DateTime.parse(json['time']),
      service: json['service'],
    );
  }
}
