import 'package:flutter/material.dart';
import 'package:musafr/feature/chat/domain/entity/hotel_info.dart';
import 'package:musafr/feature/chat/framework/widget/hotel/hotelCardView.dart';

class HotelListView extends StatefulWidget {
  final List<HotelInfo?>? hotels;

  const HotelListView({super.key, required this.hotels});

  @override
  State<HotelListView> createState() => _HotelListViewState();
}

class _HotelListViewState extends State<HotelListView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.85, // Shows next item a little
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.hotels?.length ?? 0,
        itemBuilder: (context, index) {
          final hotel = widget.hotels?[index];

          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double scale = 1.0;

              // if (_pageController.position.haveDimensions) {
              //   double pageOffset = _pageController.page! - index;
              //   scale = (1 - pageOffset.abs() * 0.15).clamp(0.85, 1.0);
              // }

              return Transform.scale(scale: scale, child: child);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _HotelCard(hotel: hotel),
            ),
          );
        },
      ),
    );
  }
}

class _HotelCard extends StatelessWidget {
  const _HotelCard({required this.hotel});

  final HotelInfo? hotel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/cafe.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
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
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/star.png',
                            fit: BoxFit.cover,
                            width: 20,
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                            child: Text(
                              hotel?.rating?.toString() ?? "",
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.favorite_border, color: Colors.white),
                  ],
                ),
                const Spacer(),
                HotelCardView(hotel: hotel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
