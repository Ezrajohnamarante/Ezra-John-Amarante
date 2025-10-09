import 'package:flutter/material.dart';
import 'computer.dart';

class Order {
  final String id;
  final Computer computer;
  final String customerName;
  final String customerType;
  final String address;
  final String phone;
  final DateTime deliveryDate;
  final TimeOfDay deliveryTime;
  final bool includeKeyboard;
  final bool includeMouse;
  final bool includeMonitor;
  final bool extendedWarranty;
  final bool insuranceProtection;
  final String specialInstructions;
  final double total;
  final DateTime orderDate;

  Order({
    required this.id,
    required this.computer,
    required this.customerName,
    required this.customerType,
    required this.address,
    required this.phone,
    required this.deliveryDate,
    required this.deliveryTime,
    required this.includeKeyboard,
    required this.includeMouse,
    required this.includeMonitor,
    required this.extendedWarranty,
    required this.insuranceProtection,
    required this.specialInstructions,
    required this.total,
    required this.orderDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'computer': computer.toJson(),
      'customerName': customerName,
      'customerType': customerType,
      'address': address,
      'phone': phone,
      'deliveryDate': deliveryDate.toIso8601String(),
      'deliveryTimeHour': deliveryTime.hour,
      'deliveryTimeMinute': deliveryTime.minute,
      'includeKeyboard': includeKeyboard,
      'includeMouse': includeMouse,
      'includeMonitor': includeMonitor,
      'extendedWarranty': extendedWarranty,
      'insuranceProtection': insuranceProtection,
      'specialInstructions': specialInstructions,
      'total': total,
      'orderDate': orderDate.toIso8601String(),
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      computer: Computer.fromJson(json['computer']),
      customerName: json['customerName'],
      customerType: json['customerType'],
      address: json['address'],
      phone: json['phone'],
      deliveryDate: DateTime.parse(json['deliveryDate']),
      deliveryTime: TimeOfDay(
        hour: json['deliveryTimeHour'],
        minute: json['deliveryTimeMinute'],
      ),
      includeKeyboard: json['includeKeyboard'],
      includeMouse: json['includeMouse'],
      includeMonitor: json['includeMonitor'],
      extendedWarranty: json['extendedWarranty'],
      insuranceProtection: json['insuranceProtection'],
      specialInstructions: json['specialInstructions'],
      total: json['total'].toDouble(),
      orderDate: DateTime.parse(json['orderDate']),
    );
  }
}
