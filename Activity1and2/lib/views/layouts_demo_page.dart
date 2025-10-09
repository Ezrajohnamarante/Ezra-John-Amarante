import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

// Layouts Demo Page - Demonstrates all 10 layout activities
class LayoutsDemoPage extends StatelessWidget {
  const LayoutsDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Demos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildDemoCard(
            context,
            'Activity 1: Row with Equal Spacing',
            'Three Text widgets in a Row',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Activity1Page()),
            ),
          ),
          _buildDemoCard(
            context,
            'Activity 2: Centered Column',
            'Two buttons centered vertically and horizontally',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Activity2Page()),
            ),
          ),
          _buildDemoCard(
            context,
            'Activity 3: Container Styling',
            'Container with padding, margin, and background',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Activity3Page()),
            ),
          ),
          _buildDemoCard(
            context,
            'Activity 4: Profile Card',
            'Row and Column combined layout',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Activity4Page()),
            ),
          ),
          _buildDemoCard(
            context,
            'Activity 5: Responsive Layout',
            'Expanded widgets sharing screen width',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Activity5Page()),
            ),
          ),
          _buildDemoCard(
            context,
            'Activity 6: Navigation Bar',
            'Row with evenly spaced icons',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Activity6Page()),
            ),
          ),
          _buildDemoCard(
            context,
            'Activity 7: Stack Layout',
            'Background image with floating button',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Activity7Page()),
            ),
          ),
          _buildDemoCard(
            context,
            'Activity 8: Flexible Widgets',
            'Dynamic resizing with orientation changes',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Activity8Page()),
            ),
          ),
          _buildDemoCard(
            context,
            'Activity 9: Chat Bubble UI',
            'Container with rounded borders',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Activity9Page()),
            ),
          ),
          _buildDemoCard(
            context,
            'Activity 10: Grid-like Layout',
            'Row and Column combined without GridView',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Activity10Page()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoCard(
    BuildContext context,
    String title,
    String description,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

// Activity 1: Row with three Text widgets with equal spacing
class Activity1Page extends StatelessWidget {
  const Activity1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 1: Row with Equal Spacing'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Dental Services',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              // Row with three Text widgets with equal spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Checkup',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Cleaning',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Whitening',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Using Row with MainAxisAlignment.spaceEvenly',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Activity 2: Column with two buttons centered
class Activity2Page extends StatelessWidget {
  const Activity2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 2: Centered Column'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.local_hospital, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Book Your Appointment',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            // Two buttons in a Column, centered
            CustomButton(
              text: 'Schedule Now',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Schedule button pressed')),
                );
              },
              icon: Icons.calendar_today,
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'View Available Slots',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('View slots button pressed')),
                );
              },
              icon: Icons.access_time,
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

// Activity 3: Container with padding, margin, and background color
class Activity3Page extends StatelessWidget {
  const Activity3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 3: Container Styling'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container with padding, margin, and background color
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue, width: 2),
              ),
              child: const Text(
                'Welcome to Our Dental Clinic!\n\nWe provide the best dental care with modern equipment and experienced dentists.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Margin: 20px | Padding: 24px | Background: Blue',
                style: TextStyle(fontSize: 14, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Activity 4: Profile card with Row and Column
class Activity4Page extends StatelessWidget {
  const Activity4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 4: Profile Card'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Row for profile picture and name
                Row(
                  children: [
                    // Profile picture
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Name and title
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Sarah Johnson',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Senior Dentist',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 12),
                // Column for details
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.email, size: 20, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('sarah.johnson@dentalclinic.com'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.phone, size: 20, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('+1 (555) 123-4567'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.work, size: 20, color: Colors.blue),
                        SizedBox(width: 8),
                        Text('15 years experience'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Activity 5: Responsive layout with Expanded
class Activity5Page extends StatelessWidget {
  const Activity5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 5: Responsive Layout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Appointment Statistics',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Row with two Expanded containers sharing screen width
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, size: 40, color: Colors.blue),
                        SizedBox(height: 8),
                        Text(
                          '156',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Completed'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150,
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pending, size: 40, color: Colors.orange),
                        SizedBox(height: 8),
                        Text(
                          '23',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Pending'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Another row with different flex values
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Flex: 2\n(66.6%)',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Flex: 1\n(33.3%)',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Activity 6: Navigation bar with Row
class Activity6Page extends StatelessWidget {
  const Activity6Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 6: Navigation Bar'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.home, size: 80, color: Colors.blue),
                  const SizedBox(height: 16),
                  const Text(
                    'Main Content Area',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Custom navigation bar below',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ),
          // Custom navigation bar using Row with evenly spaced icons
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(Icons.home, 'Home', Colors.blue),
                _buildNavItem(Icons.calendar_today, 'Schedule', Colors.grey),
                _buildNavItem(Icons.people, 'Patients', Colors.grey),
                _buildNavItem(Icons.notifications, 'Alerts', Colors.grey),
                _buildNavItem(Icons.settings, 'Settings', Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: color == Colors.blue ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

// Activity 7: Stack layout with background and floating button
class Activity7Page extends StatelessWidget {
  const Activity7Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 7: Stack Layout'),
      ),
      body: Stack(
        children: [
          // Background image (using placeholder)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade700,
                ],
              ),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_hospital, size: 100, color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    'Dental Clinic',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Your smile is our priority',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Floating button overlay (bottom right)
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton.extended(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Book appointment clicked')),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Book Now'),
              backgroundColor: Colors.orange,
            ),
          ),
          // Another floating element (top right)
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 20),
                  SizedBox(width: 4),
                  Text(
                    '4.9',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Activity 8: Flexible widgets with dynamic resizing
class Activity8Page extends StatelessWidget {
  const Activity8Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 8: Flexible Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Rotate device to see dynamic resizing',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Using Flexible to resize dynamically
            Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_today, size: 50, color: Colors.blue),
                      SizedBox(height: 8),
                      Text(
                        'Flexible (flex: 2)',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Takes 2/4 of available space'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people, size: 40, color: Colors.green),
                      SizedBox(height: 8),
                      Text(
                        'Flexible (flex: 1)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Takes 1/4 of available space'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings, size: 40, color: Colors.orange),
                      SizedBox(height: 8),
                      Text(
                        'Flexible (flex: 1)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Takes 1/4 of available space'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Activity 9: Chat bubble UI
class Activity9Page extends StatelessWidget {
  const Activity9Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 9: Chat Bubble UI'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildChatBubble(
            'Hello! I would like to book an appointment.',
            true,
            Colors.blue.shade100,
          ),
          const SizedBox(height: 12),
          _buildChatBubble(
            'Of course! What day works best for you?',
            false,
            Colors.grey.shade200,
          ),
          const SizedBox(height: 12),
          _buildChatBubble(
            'How about next Tuesday at 2 PM?',
            true,
            Colors.blue.shade100,
          ),
          const SizedBox(height: 12),
          _buildChatBubble(
            'Perfect! I have you scheduled for Tuesday at 2 PM. See you then!',
            false,
            Colors.grey.shade200,
          ),
          const SizedBox(height: 12),
          _buildChatBubble(
            'Thank you!',
            true,
            Colors.blue.shade100,
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String message, bool isUser, Color color) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isUser ? const Radius.circular(16) : const Radius.circular(4),
            bottomRight: isUser ? const Radius.circular(4) : const Radius.circular(16),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

// Activity 10: Grid-like layout using Row and Column
class Activity10Page extends StatelessWidget {
  const Activity10Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 10: Grid-like Layout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Dental Services Grid',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // First row of grid
            Row(
              children: [
                Expanded(
                  child: _buildGridItem(
                    Icons.medical_services,
                    'Checkup',
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildGridItem(
                    Icons.cleaning_services,
                    'Cleaning',
                    Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Second row of grid
            Row(
              children: [
                Expanded(
                  child: _buildGridItem(
                    Icons.straighten,
                    'Braces',
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildGridItem(
                    Icons.auto_awesome,
                    'Whitening',
                    Colors.purple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Third row of grid
            Row(
              children: [
                Expanded(
                  child: _buildGridItem(
                    Icons.healing,
                    'Surgery',
                    Colors.red,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildGridItem(
                    Icons.child_care,
                    'Pediatric',
                    Colors.teal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Grid created using Row and Column only',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String label, Color color) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
