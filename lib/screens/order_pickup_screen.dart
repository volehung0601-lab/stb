import 'package:flutter/material.dart';

class OrderPickUpScreen extends StatelessWidget {
  const OrderPickUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Order & Pick-up',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Color(0xFF00704A), size: 26),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Chức năng tìm kiếm đang được phát triển.')),
                );
              },
            ),
            const SizedBox(width: 8),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                indicatorColor: Color(0xFF00704A),
                indicatorWeight: 3.0,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Color(0xFF00704A),
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                tabs: [
                  Tab(text: 'Món Nước Theo Mùa'),
                  Tab(text: 'Món Bánh Theo Mùa'),
                  Tab(text: 'Merchandise Theo Mùa'),
                  Tab(text: 'Món Nước'),
                  Tab(text: 'Món Bánh'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildSeasonalDrinksTab(),
            _buildSeasonalPastriesTab(),
            _buildSeasonalMerchTab(),
            _buildDrinksTab(),
            _buildPastriesTab(),
          ],
        ),
        bottomNavigationBar: _buildBottomCartBar(context),
      ),
    );
  }

  // --- TAB 1: MÓN NƯỚC THEO MÙA ---
  Widget _buildSeasonalDrinksTab() {
    final List<Map<String, String>> drinks = [
      {
        'name': 'Iced Black Milk Tea with White Konjac Pearl',
        'image': 'assets/images/iced_milk_tea.png',
      },
      {
        'name': 'Iced Oolong Milk Tea with Tea Konjac Pearl',
        'image': 'assets/images/iced_milk_tea.png',
      },
      {
        'name': 'Iced Black Tea with Chocolate Black Tea Cold Foam',
        'image': 'assets/images/iced_black_tea.png',
      },
      {
        'name': 'Iced Hojicha Oatmilk Tea Latte',
        'image': 'assets/images/aerocano_cup.png',
      },
      {
        'name': 'Hojicha Oatmilk Tea Latte',
        'image': 'assets/images/aerocano_cup.png',
      },
      {
        'name': 'Hojicha Oatmilk Cream',
        'image': 'assets/images/purple_ruby_cup.png',
      },
    ];

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        final drink = drinks[index];
        final bool isEven = index % 2 == 0;
        return Container(
          width: double.infinity,
          height: 110,
          color: isEven ? const Color(0xFFF7F7F7) : Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Row(
            children: [
              // Circular avatar
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: isEven ? Colors.white : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      drink['image']!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              // Name
              Expanded(
                child: Text(
                  drink['name']!,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // --- TAB 2: MÓN BÁNH THEO MÙA ---
  Widget _buildSeasonalPastriesTab() {
    final List<Map<String, String>> pastries = [
      {
        'name': 'Mon Purple Cream Rainbow Cake',
        'image': 'assets/images/rainbow_cake.png',
      },
      {
        'name': 'Purple Taro Rainbow Croissant',
        'image': 'assets/images/rainbow_croissant.png',
      },
      {
        'name': 'Pork Loaf English Muffin',
        'image': 'assets/images/english_muffin.png',
      },
      {
        'name': 'Teriyaki Pork Bun With Radish Slaw',
        'image': 'assets/images/breakfast_combo.png',
      },
      {
        'name': 'Kumquat & Lemongrass Chicken Bun',
        'image': 'assets/images/breakfast_combo.png',
      },
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTabHeader('Món Bánh Theo Mùa'),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: pastries.length,
            itemBuilder: (context, index) {
              final pastry = pastries[index];
              final bool isEven = index % 2 == 0;
              return Container(
                width: double.infinity,
                height: 110,
                color: isEven ? const Color(0xFFF7F7F7) : Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: isEven ? Colors.white : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            pastry['image']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        pastry['name']!,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // --- TAB 3: MERCHANDISE THEO MÙA ---
  Widget _buildSeasonalMerchTab() {
    final List<Map<String, String>> merch = [
      {
        'name': 'BST Bearista™\nResort',
        'image': 'assets/images/bearista_resort.png',
      },
      {
        'name': 'BST Bearista\nJourney',
        'image': 'assets/images/welcome_hand.png',
      },
      {
        'name': 'BST Horoscope',
        'image': 'assets/images/tumblers_grey.png',
      },
      {
        'name': 'BST Easybreezy,\nA Little Lazy',
        'image': 'assets/images/tumblers_pastel.png',
      },
      {
        'name': 'BST Rainbow\nHeart',
        'image': 'assets/images/mangosteen_cup.png',
      },
      {
        'name': 'BST Wireframe\nFuturism',
        'image': 'assets/images/tumblers_grey.png',
      },
    ];

    final List<Map<String, String>> drinkCategories = [
      {
        'name': 'Brewed Coffee',
        'image': 'assets/images/aerocano_cup.png',
      },
      {
        'name': 'Espresso &\nCoffee',
        'image': 'assets/images/aerocano_cup.png',
      },
      {
        'name': 'Frappuccino\nBlended\nBeverage',
        'image': 'assets/images/iced_milk_tea.png',
      },
      {
        'name': 'Teavana Teas',
        'image': 'assets/images/iced_black_tea.png',
      },
      {
        'name': 'Other\nBeverages',
        'image': 'assets/images/purple_ruby_cup.png',
      },
      {
        'name': 'Refreshers™ Be\nverage',
        'image': 'assets/images/mangosteen_cup.png',
      },
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTabHeader('Merchandise Theo Mùa'),
          _buildGrid(merch),
          const SizedBox(height: 10),
          _buildTabHeader('Món Nước'),
          _buildGrid(drinkCategories),
        ],
      ),
    );
  }

  // --- TAB 4: MÓN NƯỚC ---
  Widget _buildDrinksTab() {
    final List<Map<String, String>> drinkCategories = [
      {
        'name': 'Brewed Coffee',
        'image': 'assets/images/aerocano_cup.png',
      },
      {
        'name': 'Espresso &\nCoffee',
        'image': 'assets/images/aerocano_cup.png',
      },
      {
        'name': 'Frappuccino\nBlended\nBeverage',
        'image': 'assets/images/iced_milk_tea.png',
      },
      {
        'name': 'Teavana Teas',
        'image': 'assets/images/iced_black_tea.png',
      },
      {
        'name': 'Other\nBeverages',
        'image': 'assets/images/purple_ruby_cup.png',
      },
      {
        'name': 'Refreshers™ Be\nverage',
        'image': 'assets/images/mangosteen_cup.png',
      },
    ];

    final List<Map<String, String>> pastryCategories = [
      {
        'name': 'Bakery',
        'image': 'assets/images/breakfast_combo.png',
      },
      {
        'name': 'Sandwiches &\nLightmeal',
        'image': 'assets/images/english_muffin.png',
      },
      {
        'name': 'Desserts',
        'image': 'assets/images/rainbow_cake.png',
      },
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTabHeader('Món Nước'),
          _buildGrid(drinkCategories),
          const SizedBox(height: 10),
          _buildTabHeader('Món Bánh'),
          _buildGrid(pastryCategories),
        ],
      ),
    );
  }

  // --- TAB 5: MÓN BÁNH ---
  Widget _buildPastriesTab() {
    final List<Map<String, String>> pastryCategories = [
      {
        'name': 'Bakery',
        'image': 'assets/images/breakfast_combo.png',
      },
      {
        'name': 'Sandwiches &\nLightmeal',
        'image': 'assets/images/english_muffin.png',
      },
      {
        'name': 'Desserts',
        'image': 'assets/images/rainbow_cake.png',
      },
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTabHeader('Món Bánh'),
          _buildGrid(pastryCategories),
        ],
      ),
    );
  }

  // --- UI BUILDER HELPERS ---
  Widget _buildTabHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'XEM TẤT CẢ',
            style: TextStyle(
              color: Color(0xFF00704A),
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(List<Map<String, String>> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.1,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      item['image']!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item['name']!,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomCartBar(BuildContext context) {
    return Container(
      color: const Color(0xFF0E382C),
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Store and Order Label
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Chức năng chọn cửa hàng đang được phát triển.')),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ORDER & PICK UP',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: const [
                    Text(
                      'Van Hanh Mall',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Shopping bag cart indicator
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Giỏ hàng trống.')),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 32,
                ),
                Positioned(
                  bottom: 5,
                  child: const Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
