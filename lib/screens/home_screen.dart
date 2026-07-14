import 'package:flutter/material.dart';
import 'promo_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 100), // Space for floating button
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  
                  // Greeting Title matching the third screenshot
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Khởi đầu ngày mới với cà phê! ☕',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Quick Actions Bar: Đăng nhập, Hộp thư, Profile
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        // Login Action
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            child: Row(
                              children: const [
                                Icon(Icons.login, size: 24, color: Colors.black87),
                                SizedBox(width: 8),
                                Text(
                                  'Đăng nhập',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 25),
                        // Inbox Action
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Hộp thư chưa có tin nhắn mới.')),
                            );
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            child: Row(
                              children: const [
                                Icon(Icons.mail_outline, size: 24, color: Colors.black87),
                                SizedBox(width: 8),
                                Text(
                                  'Hộp thư',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        // Profile Avatar Outline Button
                        IconButton(
                          icon: const Icon(Icons.account_circle_outlined, size: 30, color: Colors.black87),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  
                  // Divider
                  const Divider(thickness: 1, height: 1, color: Color(0xFFEEEEEE)),
                  const SizedBox(height: 20),

                  // --- CARD 1: HƯƠNG VỊ TƯƠI MÁT ---
                  _buildPromoCard(
                    context: context,
                    backgroundColor: const Color(0xFFFCF8F2),
                    hasSideBorders: true,
                    leftFlex: 9,
                    rightFlex: 13,
                    title: 'HƯƠNG VỊ TƯƠI MÁT',
                    subtitle: 'Apple Mangosteen With Glitter Pop Starbucks Refreshers™ Beverage Series...',
                    imageSection: _buildRealisticRefreshers(),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PromoDetailScreen(
                            title: 'HƯƠNG VỊ TƯƠI MÁT',
                            subtitle: 'Apple Mangosteen With Glitter Pop Starbucks Refreshers™ Beverage Series',
                            backgroundColor: const Color(0xFFFCF8F2),
                            hasSideBorders: true,
                            imageSection: _buildRealisticRefreshers(),
                            descriptions: const [
                              'Sự hòa quyện của nước trái cây với hương táo và măng cụt, kết hợp chiết xuất cà phê xanh. Thức uống được pha cùng nước chanh hoặc sữa dừa, đá lạnh, kèm trân châu hương măng cụt và những miếng táo giòn ngon.',
                              'Starbucks® Aerocano / Starbucks® Honey Ruby Grapefruit Aerocano',
                              'Starbucks® Aerocano là thức uống cà phê lạnh mới mẻ, kết hợp giữa shot espresso được đánh khí cùng đá. Sự hòa quyện này tạo nên hương vị sảng khoái, xen lẫn độ béo mịn nhẹ nhàng từ lớp bọt khí.',
                              'Sự kết hợp giữa Aerocano cùng sốt Honey Ruby Grapefruit tạo nên hương vị chua ngọt tươi mới mang đến trải nghiệm vừa thanh mát, vừa béo mượt.',
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // --- CARD 2: BỘ SƯU TẬP MỚI (Wireframe Futurism) ---
                  _buildPromoCard(
                    context: context,
                    backgroundColor: const Color(0xFFBDC5CD),
                    backgroundGradient: const LinearGradient(
                      colors: [Color(0xFFB0B9C1), Color(0xFF8E99A5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    title: 'BỘ SƯU TẬP MỚI',
                    subtitle: 'Wireframe Futurism',
                    imageSection: Image.asset(
                      'assets/images/tumblers_grey.png',
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PromoDetailScreen(
                            title: 'BỘ SƯU TẬP MỚI',
                            backgroundColor: const Color(0xFFBDC5CD),
                            backgroundGradient: const LinearGradient(
                              colors: [Color(0xFFB0B9C1), Color(0xFF8E99A5)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            imageSection: Image.asset(
                              'assets/images/tumblers_grey.png',
                              fit: BoxFit.contain,
                            ),
                            descriptions: const [
                              'Bộ sưu tập mới hiện đã có mặt với số lượng giới hạn tại các cửa hàng, ngoại trừ: Bà Nà Hills, Bà Kiosk, Bà Golden Bridge (Đà Nẵng), Trần Hưng Đạo (Hội An, Quảng Nam), Sân bay nội địa & quốc tế Nội Bài (Hà Nội), Nha Trang Vinwonders, Beach House Sun Primavera và Sân bay Phú Quốc.',
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // --- CARD 3: BỘ SƯU TẬP MỚI (Easy, Breezy) ---
                  _buildPromoCard(
                    context: context,
                    backgroundColor: const Color(0xFFE2ECE4),
                    backgroundGradient: const LinearGradient(
                      colors: [Color(0xFFDEEBE2), Color(0xFFC0D6C8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    title: 'BỘ SƯU TẬP MỚI',
                    subtitle: 'Easy, Breezy, A Little Lazy / Rainbow Heart',
                    imageSection: Image.asset(
                      'assets/images/tumblers_pastel.png',
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PromoDetailScreen(
                            title: 'BỘ SƯU TẬP MỚI',
                            backgroundColor: const Color(0xFFE2ECE4),
                            backgroundGradient: const LinearGradient(
                              colors: [Color(0xFFDEEBE2), Color(0xFFC0D6C8)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            imageSection: Image.asset(
                              'assets/images/tumblers_pastel.png',
                              fit: BoxFit.contain,
                            ),
                            descriptions: const [
                              'Bộ sưu tập mới hiện đã có mặt với số lượng giới hạn tại các cửa hàng, ngoại trừ: Bà Nà Hills, Bà Kiosk, Bà Golden Bridge (Đà Nẵng), Trần Hưng Đạo (Hội An, Quảng Nam), Sân bay nội địa & quốc tế Nội Bài (Hà Nội), Nha Trang Vinwonders, Beach House Sun Primavera và Sân bay Phú Quốc.',
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // --- CARD 4: NĂNG LƯỢNG NGÀY MỚI (Set điểm tâm) ---
                  _buildPromoCard(
                    context: context,
                    backgroundColor: const Color(0xFFF2ECE1),
                    hasWavyBorders: true,
                    title: 'NĂNG LƯỢNG NGÀY MỚI',
                    subtitle: 'Set điểm tâm tại Starbucks',
                    imageSection: Image.asset(
                      'assets/images/garlic_combo.png',
                      fit: BoxFit.contain,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PromoDetailScreen(
                            title: 'NĂNG LƯỢNG NGÀY MỚI',
                            backgroundColor: const Color(0xFFF2ECE1),
                            hasWavyBorders: true,
                            imageSection: Image.asset(
                              'assets/images/garlic_combo.png',
                              fit: BoxFit.contain,
                            ),
                            descriptions: const [
                              'Nạp năng lượng cho một ngày mới với bữa điểm tâm tại Starbucks.',
                              '*Các sản phẩm thức ăn có thể khác nhau tại các vùng.',
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),

                  // Bottom celebration message
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.celebration, color: const Color(0xFF008248).withValues(alpha: 0.8), size: 36),
                        const SizedBox(height: 8),
                        const Text(
                          'Bạn đã được cập nhật thông tin mới nhất!',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            
            // Floating Registration Button at the bottom-right
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton.extended(
                heroTag: 'registerBtn',
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                backgroundColor: const Color(0xFF008248), // Starbucks Green
                foregroundColor: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                  child: Text(
                    'Đăng ký',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Generalized Promo Card Widget
  Widget _buildPromoCard({
    required BuildContext context,
    required Color backgroundColor,
    required String title,
    required String subtitle,
    required Widget imageSection,
    bool hasSideBorders = false,
    bool hasWavyBorders = false,
    Gradient? backgroundGradient,
    int leftFlex = 11,
    int rightFlex = 10,
    VoidCallback? onPressed,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 230,
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: backgroundGradient,
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Optional Left & Right Borders
          if (hasSideBorders) ...[
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: _buildSidePattern(isLeft: true),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: _buildSidePattern(isLeft: false),
            ),
          ],
          
          if (hasWavyBorders) ...[
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: _buildWavyPattern(isLeft: true),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: _buildWavyPattern(isLeft: false),
            ),
          ],

          // Card Content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                // Left Side text content
                Expanded(
                  flex: leftFlex,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          shadows: [
                            Shadow(color: Colors.black38, blurRadius: 4, offset: Offset(1, 1)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        subtitle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          shadows: [
                            Shadow(color: Colors.black38, blurRadius: 4, offset: Offset(1, 1)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: onPressed ?? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Đang xem chi tiết: $title')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black87,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        child: const Text(
                          'Tìm hiểu thêm',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Right Side image section
                Expanded(
                  flex: rightFlex,
                  child: Center(child: imageSection),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Side decorative pattern for Banner 1 (Alternating colorful starbursts)
  Widget _buildSidePattern({required bool isLeft}) {
    return Container(
      width: 16,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          10,
          (index) => Icon(
            Icons.star,
            size: 9,
            color: index % 3 == 0
                ? const Color(0xFF00704A)
                : (index % 3 == 1 ? const Color(0xFFE03A3E) : const Color(0xFFF3A100)),
          ),
        ),
      ),
    );
  }

  // Side decorative pattern for Banner 4 (Wavy brown & green lines)
  Widget _buildWavyPattern({required bool isLeft}) {
    return Container(
      width: 12,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildWavyLine(Colors.brown[400]!),
          _buildWavyLine(const Color(0xFF008248)),
        ],
      ),
    );
  }

  Widget _buildWavyLine(Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        8,
        (index) => Container(
          width: 2,
          height: 18,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  // Realistic Starbucks Refreshers with precise labels and NEW badges
  Widget _buildRealisticRefreshers() {
    return SizedBox(
      height: 170,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Starbucks® Aerocano™ (Left)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 12),
                Expanded(
                  child: Image.asset(
                    'assets/images/aerocano_cup.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Starbucks® Aerocano™',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: Color(0xFF003F2D),
                    fontSize: 5.5,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          // 2. Apple Mangosteen (Center)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildNewBadge(),
                const SizedBox(height: 2),
                Expanded(
                  child: Image.asset(
                    'assets/images/mangosteen_cup.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Apple Mangosteen\nWITH Glitter Pop Lemonade\nStarbucks Refreshers™ Beverage',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                    color: Color(0xFF003F2D),
                    fontSize: 5.0,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          // 3. Purple Ruby Pop (Right)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildNewBadge(),
                const SizedBox(height: 2),
                Expanded(
                  child: Image.asset(
                    'assets/images/purple_ruby_cup.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Purple Ruby Pop Drink\nWITH Apple Mangosteen\nStarbucks Refreshers™ Beverage\n(Made with Coconut Milk)',
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  style: TextStyle(
                    color: Color(0xFF003F2D),
                    fontSize: 4.8,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Small blue "NEW" badge for refreshers
  Widget _buildNewBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
      decoration: BoxDecoration(
        color: const Color(0xFF00A3FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'NEW',
        style: TextStyle(
          color: Colors.white,
          fontSize: 6,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
