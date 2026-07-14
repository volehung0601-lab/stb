import 'package:flutter/material.dart';

class GiftingScreen extends StatelessWidget {
  const GiftingScreen({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                // Centered Title
                const Text(
                  'Trải nghiệm tặng quà cùng\nStarbucks Gifting',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 16),
                // Centered Subtitle
                const Text(
                  'Gửi quà tặng cho những người thân yêu cùng thẻ quà tặng điện tử hoặc các lựa chọn Gói ưu đãi tiết kiệm',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.45,
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Illustration Area
                Center(
                  child: SizedBox(
                    width: 320,
                    height: 250,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Background Wavy Curves
                        Positioned(
                          bottom: -20,
                          child: Container(
                            width: 360,
                            height: 130,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E5C45),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -35,
                          child: Container(
                            width: 360,
                            height: 120,
                            decoration: BoxDecoration(
                              color: const Color(0xFF6EC3A2).withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -50,
                          child: Container(
                            width: 360,
                            height: 110,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEDAB3).withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        
                        // Stars
                        _buildStar(top: 60, left: 60, size: 14),
                        _buildStar(top: 110, left: 40, size: 10),
                        _buildStar(top: 90, right: 60, size: 14),
                        _buildStar(top: 30, right: 100, size: 18),
                        _buildStar(top: 130, right: 30, size: 10),

                        // Cup on the left (Coffee cup)
                        Positioned(
                          left: 45,
                          bottom: 50,
                          child: Transform.rotate(
                            angle: -0.15,
                            child: _buildCoffeeCup(Colors.white, const Color(0xFF008248)),
                          ),
                        ),

                        // Gift Box (Center bottom)
                        Positioned(
                          bottom: 45,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color(0xFF004D34),
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: List.generate(
                                5,
                                (index) => Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 1.5),
                                    color: index % 2 == 0
                                        ? const Color(0xFFE5B842) // Yellow stripes
                                        : const Color(0xFF004D34), // Green stripes
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        // Hand and Cup emerging from box
                        Positioned(
                          bottom: 95,
                          child: Column(
                            children: [
                              // Cup in hand
                              Transform.rotate(
                                angle: 0.1,
                                child: _buildCoffeeCup(const Color(0xFFD4E9E2), const Color(0xFF008248)),
                              ),
                              const SizedBox(height: 4),
                              // Arm/Hand (Simulated with simple peach colored container)
                              Container(
                                width: 18,
                                height: 35,
                                color: const Color(0xFFFFD1A9), // Peach skin tone
                              ),
                            ],
                          ),
                        ),

                        // Plate and Croissant on the right
                        Positioned(
                          right: 35,
                          bottom: 40,
                          child: Column(
                            children: [
                              // Croissant (using custom shapes or icons)
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Light blue plate
                                  Container(
                                    width: 70,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE0F7FA),
                                      borderRadius: const BorderRadius.all(
                                        Radius.elliptical(70, 22),
                                      ),
                                      border: Border.all(color: Colors.white30),
                                    ),
                                  ),
                                  // Croissant body
                                  Positioned(
                                    bottom: 5,
                                    child: Container(
                                      width: 38,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE5A93C),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: List.generate(
                                          3,
                                          (index) => Container(
                                            width: 3.5,
                                            height: 15,
                                            color: const Color(0xFFC68B23),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Bottom Action Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Đang chuyển tới trang khám phá quà tặng.')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF008248), // Starbucks Green
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Khám phá thêm',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

  Widget _buildStar({double? top, double? left, double? right, double? bottom, required double size}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Icon(
        Icons.star,
        color: Colors.amber[300],
        size: size,
      ),
    );
  }

  Widget _buildCoffeeCup(Color cupColor, Color logoColor) {
    return Container(
      width: 38,
      height: 54,
      decoration: BoxDecoration(
        color: cupColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Straw
          Positioned(
            top: -7,
            child: Container(
              width: 3.5,
              height: 10,
              color: const Color(0xFF4CAF50),
            ),
          ),
          // Lid
          Positioned(
            top: 0,
            child: Container(
              width: 40,
              height: 4.5,
              decoration: BoxDecoration(
                color: cupColor.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
          ),
          // Starbucks Siren-like circular green logo
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: logoColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.star,
                size: 7,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
