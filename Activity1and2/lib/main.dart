import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'views/home_page.dart';
import 'views/layouts_demo_page.dart';

void main() => runApp(const DentalClinicApp());

// Root application widget - StatelessWidget
class DentalClinicApp extends StatelessWidget {
  const DentalClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dental Clinic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      home: const HomePage(),
    );
  }
}
