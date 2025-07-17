import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottomSheet/BottomSheetView.dart';

class MainActivity extends StatelessWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainScreen(),
    );
  }
}

class HotelData {
  final String name;
  final double rating;
  final int reviews;
  final String location;
  final String priceRange;
  final String category;
  final String imageUrl;
  final bool isRecommended;

  HotelData({
    required this.name,
    required this.rating,
    required this.reviews,
    required this.location,
    required this.priceRange,
    required this.category,
    required this.imageUrl,
    required this.isRecommended,
  });
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Column(
            children: [
              // Top Bar
              Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile.jpg', // Replace with your asset
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) =>
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Hi Welcome ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFA9AAAC),
                                ),
                              ),
                              Image.asset(
                                'assets/waving_hand.png',
                                // Replace with your asset
                                width: 14,
                                height: 14,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                const Text(
                                  "👋",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "User Name",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF292D32),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0x260173A5),
                                    width: 0.5,
                                  ),
                                  color: const Color(0x030173A5),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/gift.png',
                                      // Replace with your asset
                                      width: 16,
                                      height: 16,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                      const Icon(
                                        Icons.star,
                                        size: 16,
                                        color: Color(0xFF0173A5),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      "100",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF0173A5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        Icon(Icons.favorite_border, color: Colors.grey[600]),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.notifications_outlined,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Screen Content
              Flexible(child: ScreenView()),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenView extends StatefulWidget {
  const ScreenView({Key? key}) : super(key: key);

  @override
  State<ScreenView> createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView> {
  final PageController _pageController = PageController();
  final PageController _restaurantPageController = PageController();
  int _currentPage = 0;
  int _currentRestaurantPage = 0;

  // Sample hotel data
  final List<HotelData> hotels = [
    HotelData(
      name: "Nobu Doha",
      rating: 4.4,
      reviews: 532,
      location: "504 Corniche Road",
      priceRange: "300 - 500 QAR",
      category: "5 Star Hotel",
      imageUrl: "assets/images/hotel1.jpg",
      isRecommended: true,
    ),
    HotelData(
      name: "Four Seasons",
      rating: 4.7,
      reviews: 1248,
      location: "West Bay Lagoon",
      priceRange: "800 - 1200 QAR",
      category: "Luxury Hotel",
      imageUrl: "assets/images/hotel2.jpg",
      isRecommended: true,
    ),
    HotelData(
      name: "The Ritz-Carlton",
      rating: 4.6,
      reviews: 892,
      location: "West Bay",
      priceRange: "600 - 900 QAR",
      category: "Premium Hotel",
      imageUrl: "assets/images/hotel3.jpg",
      isRecommended: false,
    ),
    HotelData(
      name: "W Doha",
      rating: 4.3,
      reviews: 567,
      location: "The Pearl Qatar",
      priceRange: "400 - 700 QAR",
      category: "Boutique Hotel",
      imageUrl: "assets/images/hotel4.jpg",
      isRecommended: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 22),
            // Packages Section
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Packages from travel experts",
                    style: TextStyle(
                      color: Color(0xFF292D32),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(4, (index) {
                    final isSelected = _currentPage == index;
                    return Container(
                      margin: const EdgeInsets.all(2),
                      width: isSelected ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color:
                        isSelected
                            ? const Color(0xFF0173A5)
                            : const Color(0xFFA9AAAC),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 22),
            // Image Pager
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Image.asset(
                    'assets/image.png', // Replace with your assets
                    fit: BoxFit.contain,
                    errorBuilder:
                        (context, error, stackTrace) =>
                        Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.image, color: Colors.grey),
                          ),
                        ),
                  );
                },
              ),
            ),
            const SizedBox(height: 22),
            // Action Buttons Row
            Row(
              children: [
                Flexible(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/restaurant_back.png',
                            // Replace with your asset
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                Container(
                                  color: Colors.orange,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/cutlery_icon.svg",
                                  semanticsLabel: 'Dart Logo',
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  "Reserve a Table",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/trip_image.png',
                            // Replace with your asset
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                Container(
                                  color: Colors.blue,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "assets/Group.svg",
                                  semanticsLabel: 'Dart Logo',
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  "Plan a trip",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            // Top Restaurants Section
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Top Restaurants",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF292D32),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                showModalBottomSheet(
                context: context,
                isScrollControlled: true, // Allows the sheet to take full height
                builder: (BuildContext context) {
                return const CustomBottomSheet();
                },
                );
                },
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0173A5),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            // Restaurant Cards Pager
            SizedBox(
              height: 300,
              child: PageView.builder(
                controller: _restaurantPageController,
                onPageChanged: (page) {
                  setState(() {
                    _currentRestaurantPage = page;
                  });
                },
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/cafe.jpg', // Replace with your asset
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                  Container(
                                    color: Colors.brown,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0x4DFE3333),
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: const Text(
                                          "2 Star Hotel",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const GlassmorphicHotelCard(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}

class GlassmorphicHotelCard extends StatelessWidget {
  const GlassmorphicHotelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.3),
              Colors.white.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nobu Doha",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFFCD1A),
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "4.4",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFFFCD1A),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "(532)",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Bottom row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white.withOpacity(0.8),
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "504 Corniche Road",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "30 - 50 QAR",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.4),
                                width: 0.5,
                              ),
                            ),
                            child: Text(
                              "Recommended For You",
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
