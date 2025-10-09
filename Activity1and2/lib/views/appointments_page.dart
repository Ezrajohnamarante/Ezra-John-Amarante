import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/custom_button.dart';
import '../models/appointment.dart';

// Separate page demonstrating both Material and Cupertino widgets
class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  bool _useCupertinoStyle = false;
  final List<Appointment> _appointments = [
    Appointment(
      id: '1',
      patientName: 'John Doe',
      time: DateTime.now().add(const Duration(hours: 2)),
      service: 'General Checkup',
    ),
    Appointment(
      id: '2',
      patientName: 'Jane Smith',
      time: DateTime.now().add(const Duration(hours: 4)),
      service: 'Teeth Cleaning',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _useCupertinoStyle ? _buildCupertinoUI() : _buildMaterialUI();
  }

  // Material Design UI
  Widget _buildMaterialUI() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
        actions: [
          IconButton(
            icon: const Icon(Icons.apple),
            onPressed: () {
              setState(() {
                _useCupertinoStyle = true;
              });
            },
            tooltip: 'Switch to iOS style',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: Colors.blue),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Material Design Style',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Switch(
                      value: _useCupertinoStyle,
                      onChanged: (value) {
                        setState(() {
                          _useCupertinoStyle = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _appointments.length,
                itemBuilder: (context, index) {
                  final appointment = _appointments[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(appointment.patientName[0]),
                      ),
                      title: Text(appointment.patientName),
                      subtitle: Text(
                        '${appointment.service}\n${appointment.formattedTime}',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _showDeleteDialog(context, index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            CustomButton(
              text: 'Add Appointment',
              onPressed: _addAppointment,
              icon: Icons.add,
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }

  // Cupertino (iOS) Design UI
  Widget _buildCupertinoUI() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Appointments'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.back),
          onPressed: () => Navigator.pop(context),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.device_phone_portrait),
          onPressed: () {
            setState(() {
              _useCupertinoStyle = false;
            });
          },
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(CupertinoIcons.info_circle,
                        color: CupertinoColors.systemBlue),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Cupertino (iOS) Style',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    CupertinoSwitch(
                      value: _useCupertinoStyle,
                      onChanged: (value) {
                        setState(() {
                          _useCupertinoStyle = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _appointments.length,
                  itemBuilder: (context, index) {
                    final appointment = _appointments[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: CupertinoColors.systemGrey5,
                        ),
                      ),
                      child: CupertinoListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: CupertinoColors.systemBlue,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              appointment.patientName[0],
                              style: const TextStyle(
                                color: CupertinoColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        title: Text(appointment.patientName),
                        subtitle: Text(
                          '${appointment.service}\n${appointment.formattedTime}',
                        ),
                        trailing: CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: const Icon(
                            CupertinoIcons.delete,
                            color: CupertinoColors.destructiveRed,
                          ),
                          onPressed: () {
                            _showCupertinoDeleteDialog(context, index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              CupertinoButton.filled(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.add_circled),
                    SizedBox(width: 8),
                    Text('Add Appointment'),
                  ],
                ),
                onPressed: _addAppointment,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addAppointment() {
    setState(() {
      _appointments.add(
        Appointment(
          id: DateTime.now().toString(),
          patientName: 'New Patient',
          time: DateTime.now().add(const Duration(hours: 6)),
          service: 'Consultation',
        ),
      );
    });
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Appointment'),
        content: const Text('Are you sure you want to delete this appointment?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _appointments.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showCupertinoDeleteDialog(BuildContext context, int index) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Delete Appointment'),
        content: const Text('Are you sure you want to delete this appointment?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              setState(() {
                _appointments.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
