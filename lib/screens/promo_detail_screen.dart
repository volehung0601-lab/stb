import 'package:flutter/material.dart';

class PromoDetailScreen extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<String> descriptions;
  final Color backgroundColor;
  final Gradient? backgroundGradient;
  final Widget imageSection;
  final bool hasSideBorders;
  final bool hasWavyBorders;

  const PromoDetailScreen({
    super.key,
    required this.title,
    this.subtitle,
    required this.descriptions,
    required this.backgroundColor,
    this.backgroundGradient,
    required this.imageSection,
    this.hasSideBorders = false,
    this.hasWavyBorders = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Banner Section
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    gradient: backgroundGradient,
                  ),
                  child: Stack(
                    children: [
                      // Side Borders
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

                      // Centered product graphics
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                          child: imageSection,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Floating Back Button Overlay
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: 20,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            spreadRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black87,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Content Descriptions Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                      letterSpacing: -0.5,
                    ),
                  ),
                  
                  // Subtitle (if available)
                  if (subtitle != null && subtitle!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                        height: 1.35,
                      ),
                    ),
                  ],
                  
                  const SizedBox(height: 24),
                  const Divider(thickness: 1, color: Color(0xFFF0F0F0)),
                  const SizedBox(height: 20),

                  // Paragraph descriptions
                  ...descriptions.map((paragraph) {
                    final isHighlightedHeader = paragraph.startsWith('Starbucks®');
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        paragraph,
                        style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: isHighlightedHeader ? FontWeight.bold : FontWeight.normal,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- REUSED SIDE PATTERNS ---
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
}
