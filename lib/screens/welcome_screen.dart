import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E382C), // Starbucks Dark Green
      body: SafeArea(
        child: Column(
          children: [
            // Simulated Status Bar & Close Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Close button at top right
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white70, size: 28),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/navigation');
                    },
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      // Title
                      const Text(
                        'Trải nghiệm Order & Pick-up!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 35),
                      // Hand illustration holding phone inside a light-green circle
                      Center(
                        child: Container(
                          width: 220,
                          height: 220,
                          decoration: const BoxDecoration(
                            color: Color(0xFFD4E9E2), // Starbucks Light Teal Green
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/welcome_hand.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                // Fallback placeholder if image fails to load
                                return const Center(
                                  child: Icon(Icons.phone_iphone, size: 80, color: Color(0xFF008248)),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 45),
                      // Body text in Vietnamese
                      const Text(
                        'Một trải nghiệm dành cho các thành viên Starbucks Reward! Với tính năng Order & Pick-up, bạn có thể đặt trước và đến nhận ngay tại quầy, không cần phải xếp hàng chờ gọi món. Tiết kiệm nhiều thời gian để dành cho những điều quan trọng hơn!',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            
            // Bottom Action Button
            Padding(
              padding: const EdgeInsets.only(right: 24.0, bottom: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/navigation');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A862), // Bright Starbucks Green
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Bắt đầu đặt món',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
