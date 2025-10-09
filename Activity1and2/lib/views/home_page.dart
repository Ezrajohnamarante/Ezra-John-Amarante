import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/custom_button.dart';
import '../widgets/appointment_card.dart';
import 'appointments_page.dart';
import 'layouts_demo_page.dart'; // Import LayoutsDemoPage

// HomePage - StatefulWidget with counter functionality
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _patientCount = 0;
  int _currentIndex = 0;

  void _incrementPatientCount() {
    setState(() {
      _patientCount++;
    });
  }

  void _resetPatientCount() {
    setState(() {
      _patientCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dental Clinic'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.dashboard),
            tooltip: 'Layouts Demo',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LayoutsDemoPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: _currentIndex == 0 ? _buildHomeContent() : _buildAppointmentsContent(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
        ],
      ),
    );
  }

  // Home content with counter functionality
  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Icon(
                      Icons.local_hospital,
                      size: 60,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Welcome to Dental Clinic',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your smile is our priority',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Patient counter section
            Card(
              elevation: 4,
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Patients Served Today',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '$_patientCount',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Using custom reusable button widget
                        CustomButton(
                          text: 'Add Patient',
                          onPressed: _incrementPatientCount,
                          icon: Icons.add,
                        ),
                        CustomButton(
                          text: 'Reset',
                          onPressed: _resetPatientCount,
                          icon: Icons.refresh,
                          backgroundColor: Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Services section
            const Text(
              'Our Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildServiceCard('General Checkup', Icons.medical_services),
            _buildServiceCard('Teeth Cleaning', Icons.cleaning_services),
            _buildServiceCard('Orthodontics', Icons.straighten),
            _buildServiceCard('Cosmetic Dentistry', Icons.auto_awesome),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title selected')),
          );
        },
      ),
    );
  }

  Widget _buildAppointmentsContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Upcoming Appointments',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: const [
                AppointmentCard(
                  patientName: 'John Doe',
                  time: '10:00 AM',
                  service: 'General Checkup',
                ),
                AppointmentCard(
                  patientName: 'Jane Smith',
                  time: '11:30 AM',
                  service: 'Teeth Cleaning',
                ),
                AppointmentCard(
                  patientName: 'Bob Johnson',
                  time: '2:00 PM',
                  service: 'Orthodontics',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: 'Book New Appointment',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking feature coming soon!')),
              );
            },
            icon: Icons.add_circle,
            isFullWidth: true,
          ),
        ],
      ),
    );
  }

}
