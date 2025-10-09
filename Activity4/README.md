# EZcom - Computer Ordering System

A comprehensive Flutter application for ordering computers with full form validation and payment processing.

## Features

1. **Simple Username Form** - User registration with name input
2. **Login Form** - Email and password authentication
3. **Form Validation** - Email must contain "@", password cannot be empty
4. **Form State Management** - Uses GlobalKey<FormState> for validation
5. **Multiple Input Types** - TextField, Checkbox, and Switch widgets
6. **Registration Form** - Name, email, password, and confirm password fields
7. **Dropdown Menu** - Customer type selection (Individual, Business, Educational, Government)
8. **Date & Time Pickers** - Delivery scheduling
9. **Text Controller** - Special instructions with display functionality
10. **Local Storage** - Orders saved and displayed in history

## Currency

All prices are in Philippine Pesos (₱)

## Installation

1. Ensure Flutter is installed on your system
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Dependencies

- `shared_preferences: ^2.2.2` - For local data storage
- `flutter` - Flutter SDK

## Project Structure

\`\`\`
lib/
├── main.dart              # App entry point and home page
├── login_page.dart        # Login functionality
├── register_page.dart     # User registration
├── shop_page.dart         # Computer catalog
├── order_page.dart        # Order form with all input types
├── payment_page.dart      # Payment processing
├── orders_page.dart       # Order history
└── models/
    ├── computer.dart      # Computer model
    └── order.dart         # Order model
\`\`\`

## Usage

1. **Register/Login** - Create an account or login
2. **Browse Computers** - View available computers in the shop
3. **Place Order** - Fill out the comprehensive order form with:
   - Customer information
   - Customer type selection
   - Delivery address and phone
   - Delivery date and time
   - Add-ons (keyboard, mouse, monitor)
   - Protection plans (warranty, insurance)
   - Special instructions
4. **Payment** - Complete payment with card details
5. **View Orders** - Check order history with all details

## Form Validations

- Email must contain "@"
- Password cannot be empty
- Password confirmation must match
- Card number must be 16 digits
- CVV must be 3 digits
- All required fields validated before submission
