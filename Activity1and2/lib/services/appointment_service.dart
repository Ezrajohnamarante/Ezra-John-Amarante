import '../models/appointment.dart';

// Service class for managing appointments
class AppointmentService {
  final List<Appointment> _appointments = [];

  List<Appointment> getAllAppointments() {
    return List.unmodifiable(_appointments);
  }

  void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
  }

  void removeAppointment(String id) {
    _appointments.removeWhere((appointment) => appointment.id == id);
  }

  Appointment? getAppointmentById(String id) {
    try {
      return _appointments.firstWhere((appointment) => appointment.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Appointment> getAppointmentsByPatient(String patientName) {
    return _appointments
        .where((appointment) => appointment.patientName == patientName)
        .toList();
  }

  List<Appointment> getTodayAppointments() {
    final now = DateTime.now();
    return _appointments.where((appointment) {
      return appointment.time.year == now.year &&
          appointment.time.month == now.month &&
          appointment.time.day == now.day;
    }).toList();
  }
}
