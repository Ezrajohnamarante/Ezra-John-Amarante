import 'package:flutter/material.dart';
import 'order_page.dart';
import 'orders_page.dart';
import 'models/computer.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final computers = [
      Computer(
        id: '1',
        name: 'Gaming Beast Pro',
        processor: 'Intel Core i9-13900K',
        ram: '32GB DDR5',
        storage: '2TB NVMe SSD',
        gpu: 'NVIDIA RTX 4090',
        price: 125000,
        image: '/placeholder.svg?height=200&width=300',
      ),
      Computer(
        id: '2',
        name: 'Office Workstation',
        processor: 'Intel Core i7-13700',
        ram: '16GB DDR4',
        storage: '1TB SSD',
        gpu: 'Integrated Graphics',
        price: 45000,
        image: '/placeholder.svg?height=200&width=300',
      ),
      Computer(
        id: '3',
        name: 'Creator Studio',
        processor: 'AMD Ryzen 9 7950X',
        ram: '64GB DDR5',
        storage: '4TB NVMe SSD',
        gpu: 'NVIDIA RTX 4080',
        price: 150000,
        image: '/placeholder.svg?height=200&width=300',
      ),
      Computer(
        id: '4',
        name: 'Budget Builder',
        processor: 'Intel Core i5-13400',
        ram: '16GB DDR4',
        storage: '512GB SSD',
        gpu: 'NVIDIA GTX 1660',
        price: 35000,
        image: '/placeholder.svg?height=200&width=300',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('EZcom Shop'),
        backgroundColor: const Color(0xFF1A1A1A),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrdersPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: computers.length,
        itemBuilder: (context, index) {
          final computer = computers[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(computer: computer),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.computer,
                          size: 64,
                          color: Color(0xFF8B5CF6),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      computer.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildSpec(Icons.memory, computer.processor),
                    _buildSpec(Icons.storage, '${computer.ram} | ${computer.storage}'),
                    _buildSpec(Icons.videogame_asset, computer.gpu),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₱${computer.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8B5CF6),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderPage(computer: computer),
                              ),
                            );
                          },
                          child: const Text('Order Now'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSpec(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF9CA3AF)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF9CA3AF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
