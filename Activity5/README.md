# EZcom - Computer Ordering System

A comprehensive Flutter application for ordering computers with full form validation, payment processing, state management, and media features.

## Features

### Form Features (1-10)
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

### Navigation Features (1-10)
1. **Navigator.push/pop** - Navigate between screens
2. **Drawer Menu** - Side navigation to Home, About, Contact, Logout
3. **BottomNavigationBar** - Three tabs (Shop, Orders, Profile)
4. **TabBar with TabBarView** - Computer categories in shop
5. **Icons in BottomNavigationBar** - Material icons for each tab
6. **Combined Drawer + BottomNav** - Both navigation patterns in one app
7. **Named Routes** - All pages accessible via named routes
8. **push() vs pushReplacement()** - Login uses pushReplacement to home
9. **TabBar in AppBar** - Category tabs (Gaming, Office, Creator, Budget)
10. **Complete Navigation Flow** - Login → Home with Drawer and Bottom Tabs

### State Management & Media Features (1-19)
1. **Shopping Cart with Provider** - Add items to cart with ChangeNotifier
2. **ChangeNotifier Pattern** - UI updates when data changes
3. **context.read() vs context.watch()** - Demonstrated in theme and cart
4. **Theme Switcher** - Dark/light mode using Provider
5. **Todo List with Provider** - Task management with state
6. **Image.asset()** - Display local images from assets
7. **Image.network()** - Display images from internet
8. **Circular Border on Images** - BoxDecoration with border
9. **GridView of Images** - Image gallery with grid layout
10. **Video Player** - video_player package implementation
11. **Enhanced Video Player** - Chewie package with controls
12. **Audio Player** - audioplayers package with play/pause/stop
13. **Material Icons** - Dynamic color and size changes
14. **Custom Icon Set** - Material icons throughout app
15. **Custom Fonts** - Google Fonts (Roboto, Poppins)
16. **Two Font Styles** - Roboto for headings, Poppins for body
17. **Profile Card** - Image, icons, and styled text
18. **Gallery/Carousel** - carousel_slider with image slideshow
19. **Video + Audio Player** - Complete media player page

## Currency

All prices are in Philippine Pesos (₱)

## Installation

1. Ensure Flutter is installed on your system
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Dependencies

- `provider: ^6.1.1` - State management
- `shared_preferences: ^2.2.2` - Local data storage
- `video_player: ^2.8.2` - Video playback
- `chewie: ^1.7.5` - Enhanced video player controls
- `audioplayers: ^5.2.1` - Audio playback
- `carousel_slider: ^4.2.1` - Image carousel
- `google_fonts: ^6.1.0` - Custom fonts (Roboto, Poppins)
- `flutter` - Flutter SDK

## Project Structure

\`\`\`
lib/
├── main.dart              # App entry point with MultiProvider
├── login_page.dart        # Login functionality
├── register_page.dart     # User registration
├── home_page.dart         # Main page with BottomNav and Drawer
├── shop_page.dart         # Computer catalog with TabBar
├── order_page.dart        # Order form with all input types
├── payment_page.dart      # Payment processing
├── orders_page.dart       # Order history
├── cart_page.dart         # Shopping cart with Provider
├── todo_page.dart         # Todo list with Provider
├── gallery_page.dart      # Image gallery and carousel
├── media_player_page.dart # Video and audio player
├── profile_page.dart      # User profile with settings
├── about_page.dart        # About page
├── contact_page.dart      # Contact form
├── providers/
│   ├── cart_provider.dart    # Cart state management
│   ├── theme_provider.dart   # Theme state management
│   └── todo_provider.dart    # Todo state management
└── models/
    ├── computer.dart      # Computer model
    └── order.dart         # Order model

assets/
└── images/
    ├── computer1.jpg      # Computer product images
    ├── computer2.jpg
    ├── computer3.jpg
    ├── computer4.jpg
    ├── profile_placeholder.jpg
    └── logo.jpg
\`\`\`

## Usage

1. **Register/Login** - Create an account or login (uses pushReplacement)
2. **Navigate** - Use bottom tabs (Shop, Orders, Profile) or drawer menu
3. **Browse Computers** - View computers in categories via TabBar
4. **Add to Cart** - Use Provider-based cart system
5. **Place Order** - Fill out comprehensive order form
6. **Payment** - Complete payment with card details
7. **View Orders** - Check order history
8. **Manage Todos** - Create and manage tasks
9. **View Gallery** - Browse images in carousel and grid
10. **Play Media** - Watch videos and listen to audio

## Form Validations

- Email must contain "@"
- Password cannot be empty
- Password confirmation must match
- Card number must be 16 digits
- CVV must be 3 digits
- All required fields validated before submission
