import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Action Icons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.mail_outline, color: Colors.black87, size: 28),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Hộp thư trống.')),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.account_circle_outlined, color: Colors.black87, size: 28),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              
              // Title
              const Text(
                'Đặt món qua ứng dụng',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 25),
              
              // Card 1: ORDER & PICK-UP
              _buildOrderCard(
                context,
                title: 'ORDER & PICK-UP',
                description: 'Đặt món trước và đến nhận tại cửa hàng',
                icon: Icons.phone_android_outlined,
                badgeIcon: Icons.local_cafe_outlined,
              ),
              
              const SizedBox(height: 20),
              
              // Card 2: STARBUCKS® DELIVERS
              _buildOrderCard(
                context,
                title: 'STARBUCKS® DELIVERS',
                description: 'Thức uống Starbucks yêu thích của bạn sẽ được giao đến tận nơi',
                icon: Icons.motorcycle_outlined,
                badgeIcon: null,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    IconData? badgeIcon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9), // Light grey matching screenshot 3
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF0F0F0), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 28),
                InkWell(
                  onTap: () {
                    if (title == 'ORDER & PICK-UP') {
                      Navigator.pushNamed(context, '/order_pickup');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Đang chuyển tới màn hình $title.')),
                      );
                    }
                  },
                  child: const Text(
                    'ĐẶT MÓN NGAY',
                    style: TextStyle(
                      color: Color(0xFF008248),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Circle Illustration container
          Container(
            width: 84,
            height: 84,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    icon,
                    size: 40,
                    color: Colors.black54,
                  ),
                  if (badgeIcon != null)
                    Positioned(
                      right: 4,
                      bottom: 4,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Color(0xFF008248),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          badgeIcon,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
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
