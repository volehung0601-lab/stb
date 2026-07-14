import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Starbucks stores list
    final List<Map<String, String>> stores = [
      {
        'name': 'Starbucks New World',
        'address': '76 Lê Lai, Quận 1, TP. Hồ Chí Minh',
        'distance': '0.8 km',
        'status': 'Mở cửa • Đóng cửa lúc 22:00',
        'isOpen': 'true',
      },
      {
        'name': 'Starbucks Rex Hotel',
        'address': '141 Nguyễn Huệ, Quận 1, TP. Hồ Chí Minh',
        'distance': '1.2 km',
        'status': 'Mở cửa • Đóng cửa lúc 23:00',
        'isOpen': 'true',
      },
      {
        'name': 'Starbucks Nguyễn Du',
        'address': '39 Nguyễn Du, Quận 1, TP. Hồ Chí Minh',
        'distance': '1.5 km',
        'status': 'Mở cửa • Đóng cửa lúc 22:30',
        'isOpen': 'true',
      },
      {
        'name': 'Starbucks Landmark 81',
        'address': 'Vinhomes Central Park, Bình Thạnh, TP. Hồ Chí Minh',
        'distance': '3.4 km',
        'status': 'Đóng cửa • Mở cửa lúc 07:00 mai',
        'isOpen': 'false',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Tìm cửa hàng...',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
            
            // Map Placeholder / Header
            Container(
              height: 150,
              width: double.infinity,
              color: const Color(0xFFE0F2F1), // Light green-teal
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Map grid background simulated with icons
                  Icon(Icons.map_outlined, size: 80, color: const Color(0xFF008248).withValues(alpha: 0.15)),
                  Positioned(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on, color: Color(0xFF008248), size: 36),
                        SizedBox(height: 4),
                        Text(
                          'Bản đồ cửa hàng',
                          style: TextStyle(color: Color(0xFF008248), fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 8.0),
              child: Text(
                'Cửa hàng gần đây',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Stores List
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                itemCount: stores.length,
                separatorBuilder: (context, index) => const Divider(height: 24, thickness: 0.8),
                itemBuilder: (context, index) {
                  final store = stores[index];
                  final isOpen = store['isOpen'] == 'true';
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              store['name']!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              store['address']!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: isOpen ? const Color(0xFF008248) : Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  store['status']!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isOpen ? const Color(0xFF008248) : Colors.black54,
                                    fontWeight: isOpen ? FontWeight.w600 : FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            store['distance']!,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFF008248)),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.directions_car_filled_outlined,
                              color: Color(0xFF008248),
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
