import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconsDemoPage extends StatefulWidget {
  const IconsDemoPage({Key? key}) : super(key: key);

  @override
  State<IconsDemoPage> createState() => _IconsDemoPageState();
}

class _IconsDemoPageState extends State<IconsDemoPage> {
  double iconSize = 50.0;
  Color iconColor = const Color(0xFF8B5CF6);
  
  final List<Color> availableColors = [
    const Color(0xFF8B5CF6), // Purple
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Icons Demo',
          style: GoogleFonts.roboto(),
        ),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dynamic Material Icons',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Icon(
                      Icons.favorite,
                      size: iconSize,
                      color: iconColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Size: ${iconSize.toInt()}',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  Slider(
                    value: iconSize,
                    min: 20,
                    max: 150,
                    activeColor: const Color(0xFF8B5CF6),
                    onChanged: (value) {
                      setState(() {
                        iconSize = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Color',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: availableColors.map((color) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            iconColor = color;
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: iconColor == color
                                  ? Colors.white
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Material Icons Showcase',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _buildIconItem(Icons.home, 'Home', 30),
                      _buildIconItem(Icons.shopping_cart, 'Cart', 35),
                      _buildIconItem(Icons.favorite, 'Favorite', 40),
                      _buildIconItem(Icons.settings, 'Settings', 45),
                      _buildIconItem(Icons.person, 'Profile', 50),
                      _buildIconItem(Icons.notifications, 'Alerts', 55),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Custom Icon Set (Font Awesome)',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _buildFontAwesomeIcon(
                        FontAwesomeIcons.laptop,
                        'Laptop',
                        const Color(0xFF8B5CF6),
                      ),
                      _buildFontAwesomeIcon(
                        FontAwesomeIcons.desktop,
                        'Desktop',
                        Colors.blue,
                      ),
                      _buildFontAwesomeIcon(
                        FontAwesomeIcons.microchip,
                        'Chip',
                        Colors.green,
                      ),
                      _buildFontAwesomeIcon(
                        FontAwesomeIcons.memory,
                        'Memory',
                        Colors.orange,
                      ),
                      _buildFontAwesomeIcon(
                        FontAwesomeIcons.hardDrive,
                        'Storage',
                        Colors.red,
                      ),
                      _buildFontAwesomeIcon(
                        FontAwesomeIcons.keyboard,
                        'Keyboard',
                        Colors.pink,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconItem(IconData icon, String label, double size) {
    return Column(
      children: [
        Icon(
          icon,
          size: size,
          color: const Color(0xFF8B5CF6),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }

  Widget _buildFontAwesomeIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        FaIcon(
          icon,
          size: 40,
          color: color,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }
}
