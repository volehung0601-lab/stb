import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E382C), // Starbucks Dark Green
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                // Title
                const Text(
                  'Thẻ Starbucks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 16),
                // Subtitle/Description
                const Text(
                  'Để sử dụng hoặc nạp thêm tiền vào Thẻ,\nvui lòng đăng nhập hoặc đăng ký thành viên chương\ntrình Starbucks Rewards™.',
                  style: TextStyle(
                    color: Color(0xCCFFFFFF),
                    fontSize: 15,
                    height: 1.45,
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Overlapping Cards Illustration
                Center(
                  child: SizedBox(
                    width: 320,
                    height: 250,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Star 1 (Gold star top-right)
                        Positioned(
                          right: 40,
                          top: 10,
                          child: Icon(Icons.star, color: Colors.amber[300], size: 24),
                        ),
                        // Star 2 (Gold star middle-left)
                        Positioned(
                          left: 50,
                          bottom: 100,
                          child: Icon(Icons.star, color: Colors.amber[300], size: 16),
                        ),
                        // Star 3 (Gold star bottom-right)
                        Positioned(
                          right: 60,
                          bottom: 60,
                          child: Icon(Icons.star, color: Colors.amber[300], size: 20),
                        ),
                        
                        // Card 1: Thank You Card (Top Left)
                        Positioned(
                          left: 20,
                          top: 10,
                          child: Transform.rotate(
                            angle: -0.15,
                            child: _buildStarbucksCard(
                              color1: const Color(0xFFE8F5E9),
                              color2: const Color(0xFFC8E6C9),
                              textColor: const Color(0xFF2E7D32),
                              title: 'THANK YOU',
                              subtitle: 'Starbucks',
                              icon: Icons.spa,
                            ),
                          ),
                        ),
                        
                        // Card 2: Happy Birthday Card (Top Right)
                        Positioned(
                          right: 10,
                          top: 35,
                          child: Transform.rotate(
                            angle: 0.1,
                            child: _buildStarbucksCard(
                              color1: const Color(0xFFFFEBEE),
                              color2: const Color(0xFFFFCDD2),
                              textColor: const Color(0xFFC62828),
                              title: 'HAPPY\nBIRTHDAY',
                              subtitle: 'Celebrate',
                              icon: Icons.cake,
                            ),
                          ),
                        ),
                        
                        // Card 3: Cheers Card (Bottom Left)
                        Positioned(
                          left: 15,
                          bottom: 35,
                          child: Transform.rotate(
                            angle: -0.05,
                            child: _buildStarbucksCard(
                              color1: const Color(0xFFFFF3E0),
                              color2: const Color(0xFFFFE0B2),
                              textColor: const Color(0xFFEF6C00),
                              title: 'COFFEE\nTIME',
                              subtitle: 'Enjoy together',
                              icon: Icons.local_cafe,
                            ),
                          ),
                        ),
                        
                        // Card 4: Starbucks Classic Green Card (Bottom Right)
                        Positioned(
                          right: 25,
                          bottom: 10,
                          child: Transform.rotate(
                            angle: 0.05,
                            child: _buildStarbucksCard(
                              color1: const Color(0xFF004D40),
                              color2: const Color(0xFF00796B),
                              textColor: Colors.white,
                              title: 'STARBUCKS',
                              subtitle: 'Rewards™',
                              icon: Icons.star_border,
                              isClassic: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 35),
                
                // Action Buttons Stacked
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Đăng nhập Button
                      SizedBox(
                        width: 160,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Đăng nhập',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Đăng ký Button
                      SizedBox(
                        width: 160,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF008248), // Starbucks Green
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(color: Colors.white24, width: 1),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Đăng ký',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStarbucksCard({
    required Color color1,
    required Color color2,
    required Color textColor,
    required String title,
    required String subtitle,
    required IconData icon,
    bool isClassic = false,
  }) {
    return Container(
      width: 150,
      height: 95,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              Icon(icon, color: textColor.withValues(alpha: 0.8), size: 16),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  color: textColor.withValues(alpha: 0.8),
                  fontSize: 8,
                ),
              ),
              const SizedBox(height: 2),
              Container(
                height: 1.5,
                width: 25,
                color: isClassic ? Colors.amber : textColor.withValues(alpha: 0.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
