import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'models/computer.dart';
import 'models/order.dart';
import 'payment_page.dart';

class OrderPage extends StatefulWidget {
  final Computer computer;

  const OrderPage({Key? key, required this.computer}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();
  
  String _customerType = 'Individual';
  bool _includeKeyboard = false;
  bool _includeMouse = false;
  bool _includeMonitor = false;
  bool _extendedWarranty = false;
  bool _insuranceProtection = false;
  
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  
  String _displayedNotes = '';

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  double _calculateTotal() {
    double total = widget.computer.price;
    if (_includeKeyboard) total += 2500;
    if (_includeMouse) total += 1500;
    if (_includeMonitor) total += 15000;
    if (_extendedWarranty) total += 5000;
    if (_insuranceProtection) total += 3000;
    return total;
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF8B5CF6),
              surface: Color(0xFF1A1A1A),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF8B5CF6),
              surface: Color(0xFF1A1A1A),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _displayNotes() {
    setState(() {
      _displayedNotes = _notesController.text;
    });
  }

  Future<void> _proceedToPayment() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null || _selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select delivery date and time'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final order = Order(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        computer: widget.computer,
        customerName: _nameController.text,
        customerType: _customerType,
        address: _addressController.text,
        phone: _phoneController.text,
        deliveryDate: _selectedDate!,
        deliveryTime: _selectedTime!,
        includeKeyboard: _includeKeyboard,
        includeMouse: _includeMouse,
        includeMonitor: _includeMonitor,
        extendedWarranty: _extendedWarranty,
        insuranceProtection: _insuranceProtection,
        specialInstructions: _notesController.text,
        total: _calculateTotal(),
        orderDate: DateTime.now(),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentPage(order: order),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Order'),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Computer Summary
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.computer.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₱${widget.computer.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFF8B5CF6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Customer Information
            const Text(
              'Customer Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Name is required' : null,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person_outlined),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _customerType,
              decoration: const InputDecoration(
                labelText: 'Customer Type',
                prefixIcon: Icon(Icons.business_outlined),
              ),
              items: ['Individual', 'Business', 'Educational', 'Government']
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _customerType = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _addressController,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Address is required' : null,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Delivery Address',
                hintText: 'Enter your delivery address',
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Phone is required' : null,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                prefixIcon: Icon(Icons.phone_outlined),
              ),
            ),
            const SizedBox(height: 24),

            // Delivery Schedule
            const Text(
              'Delivery Schedule',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _selectDate,
                    icon: const Icon(Icons.calendar_today),
                    label: Text(
                      _selectedDate == null
                          ? 'Select Date'
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF8B5CF6),
                      side: const BorderSide(color: Color(0xFF8B5CF6)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _selectTime,
                    icon: const Icon(Icons.access_time),
                    label: Text(
                      _selectedTime == null
                          ? 'Select Time'
                          : _selectedTime!.format(context),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF8B5CF6),
                      side: const BorderSide(color: Color(0xFF8B5CF6)),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Add-ons
            const Text(
              'Add-ons',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              title: const Text('Gaming Keyboard'),
              subtitle: const Text('₱2,500.00'),
              value: _includeKeyboard,
              onChanged: (value) {
                setState(() {
                  _includeKeyboard = value!;
                });
              },
              activeColor: const Color(0xFF8B5CF6),
            ),
            CheckboxListTile(
              title: const Text('Gaming Mouse'),
              subtitle: const Text('₱1,500.00'),
              value: _includeMouse,
              onChanged: (value) {
                setState(() {
                  _includeMouse = value!;
                });
              },
              activeColor: const Color(0xFF8B5CF6),
            ),
            CheckboxListTile(
              title: const Text('24" Monitor'),
              subtitle: const Text('₱15,000.00'),
              value: _includeMonitor,
              onChanged: (value) {
                setState(() {
                  _includeMonitor = value!;
                });
              },
              activeColor: const Color(0xFF8B5CF6),
            ),
            const SizedBox(height: 16),

            // Protection Plans
            const Text(
              'Protection Plans',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text('Extended Warranty (2 Years)'),
              subtitle: const Text('₱5,000.00'),
              value: _extendedWarranty,
              onChanged: (value) {
                setState(() {
                  _extendedWarranty = value;
                });
              },
              activeColor: const Color(0xFF8B5CF6),
            ),
            SwitchListTile(
              title: const Text('Insurance Protection'),
              subtitle: const Text('₱3,000.00'),
              value: _insuranceProtection,
              onChanged: (value) {
                setState(() {
                  _insuranceProtection = value;
                });
              },
              activeColor: const Color(0xFF8B5CF6),
            ),
            const SizedBox(height: 24),

            // Special Instructions
            const Text(
              'Special Instructions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _notesController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Special Instructions',
                hintText: 'Any special requests or notes...',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _displayNotes,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2A2A2A),
              ),
              child: const Text('Display Notes'),
            ),
            if (_displayedNotes.isNotEmpty) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _displayedNotes,
                  style: const TextStyle(color: Color(0xFF9CA3AF)),
                ),
              ),
            ],
            const SizedBox(height: 24),

            // Total
            Card(
              color: const Color(0xFF8B5CF6),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '₱${_calculateTotal().toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _proceedToPayment,
                child: const Text(
                  'Proceed to Payment',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
