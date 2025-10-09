import '../models/patient.dart';

// Service class for managing patients
class PatientService {
  final List<Patient> _patients = [];

  List<Patient> getAllPatients() {
    return List.unmodifiable(_patients);
  }

  void addPatient(Patient patient) {
    _patients.add(patient);
  }

  void removePatient(String id) {
    _patients.removeWhere((patient) => patient.id == id);
  }

  Patient? getPatientById(String id) {
    try {
      return _patients.firstWhere((patient) => patient.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Patient> searchPatients(String query) {
    final lowerQuery = query.toLowerCase();
    return _patients.where((patient) {
      return patient.name.toLowerCase().contains(lowerQuery) ||
          patient.email.toLowerCase().contains(lowerQuery) ||
          patient.phone.contains(query);
    }).toList();
  }
}
