//
// import 'dart:ui';
//
// import 'package:flutter/material.dart'; // For ImageFilter.blur
// import 'package:carousel_slider/carousel_slider.dart' as carosal;
//
// class ScreenView extends StatefulWidget {
//   final EdgeInsets innerPadding;
//
//   const ScreenView({Key? key, required this.innerPadding}) : super(key: key);
//
//   @override
//   State<ScreenView> createState() => _ScreenViewState();
// }
//
// class _ScreenViewState extends State<ScreenView> {
//   final carosal.CarouselController _carouselController = carosal.CarouselController();
//   int _currentPackagePage = 0;
//   int _currentRestaurantPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView( // Use SingleChildScrollView if content overflows
//       padding: widget.innerPadding,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Packages from travel experts section
//           _buildPackagesSection(),
//           const SizedBox(height: 22),
//
//           // Reserve a Table and Plan a Trip section
//           _buildActionCards(),
//           const SizedBox(height: 22),
//
//           // Top Restaurants section
//           _buildTopRestaurantsSection(),
//           const SizedBox(height: 22),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPackagesSection() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 22.0),
//           child: Row(
//             children: [
//               const Expanded(
//                 child: Text(
//                   "Packages from travel experts",
//                   style: TextStyle(
//                     color: Color(0xFF292D32),
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               Row(
//                 children: List.generate(4, (index) {
//                   final isSelected = _currentPackagePage == index;
//                   final color = isSelected ? const Color(0xFF0173A5) : const Color(0xFFA9AAAC);
//                   return Container(
//                     margin: const EdgeInsets.all(2),
//                     width: isSelected ? 24 : 8,
//                     height: 8,
//                     decoration: BoxDecoration(
//                       color: color,
//                       shape: BoxShape.circle,
//                     ),
//                   );
//                 }),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 8), // Equivalent to bottom padding on Row in Compose
//         carosal.CarouselSlider.builder(
//           carouselController: _carouselController,
//           itemCount: 4,
//           itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
//             return ClipRRect(
//               borderRadius: BorderRadius.circular(8.0), // Optional: if your image has rounded corners
//               child: Image.asset(
//                 'assets/images/image.png', // Replace with your image asset path
//                 fit: BoxFit.cover,
//               ),
//             );
//           },
//           options: carosal.CarouselOptions(
//             height: 200, // Adjust height as needed
//             enlargeCenterPage: true, // For next/prev page preview (might need custom logic for contentPadding)
//             viewportFraction: 0.8, // Adjust for pageSpacing and contentPadding
//             initialPage: _currentPackagePage,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 _currentPackagePage = index;
//               });
//             },
//             enableInfiniteScroll: false, // Equivalent to pagerState's pageCount
//             padEnds: false, // Ensures contentPadding works as expected
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildActionCards() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: AspectRatio(
//               aspectRatio: 1,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20.0),
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/images/reserve_a_table.png', // Replace with your image asset
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/images/restaurant_icon.png', // Replace with your icon asset
//                           width: 40,
//                           height: 40,
//                         ),
//                         const SizedBox(height: 6),
//                         const Text(
//                           "Reserve a Table",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 20),
//           Expanded(
//             child: AspectRatio(
//               aspectRatio: 1,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20.0),
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/images/trip_image.png', // Replace with your image asset
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/images/trip_icon.png', // Replace with your icon asset
//                           width: 40,
//                           height: 40,
//                         ),
//                         const SizedBox(height: 6),
//                         const Text(
//                           "Plan a trip",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTopRestaurantsSection() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Row(
//             children: [
//               const Expanded(
//                 child: Text(
//                   "Top Restaurants",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF292D32),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   // Handle "See All" tap
//                 },
//                 child: const Text(
//                   "See All",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFF0173A5),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 22),
//         carosal.CarouselSlider.builder(
//           itemCount: 4, // Assuming 4 pages like the first pager
//           itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
//             return _buildRestaurantCard();
//           },
//           options: carosal.CarouselOptions(
//             height: 250, // Adjust height as needed for the card
//             enlargeCenterPage: true,
//             viewportFraction: 0.8,
//             initialPage: _currentRestaurantPage,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 _currentRestaurantPage = index;
//               });
//             },
//             enableInfiniteScroll: false,
//             padEnds: false,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildRestaurantCard() {
//     return AspectRatio(
//       aspectRatio: 2 / 1, // Matches aspectRatio(2f)
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16.0),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Image.asset(
//               'assets/images/cafe.png', // Replace with your image asset
//               fit: BoxFit.cover,
//               width: double.infinity,
//               height: double.infinity,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                         decoration: BoxDecoration(
//                           color: const Color(0x4DFE3333),
//                           borderRadius: BorderRadius.circular(6.0),
//                         ),
//                         child: const Text(
//                           "2 Star Hotel",
//                           style: TextStyle(
//                             fontSize: 10,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       const Spacer(),
//                       Image.asset(
//                         'assets/images/fav_icon.png', // Replace with your icon asset
//                         width: 24, // Adjust size as needed
//                         height: 24,
//                       ),
//                     ],
//                   ),
//                   // Hotel information content
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(20.0),
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0), // Blur effect
//                       child: Container(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               const Color(0x808B8B8B).withOpacity(0.8),
//                               const Color(0x806B6B6B).withOpacity(0.9),
//                             ],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           // Radial gradient is harder to perfectly replicate as a background here,
//                           // you might need a custom painter or separate widget if exact match is needed.
//                           // For simplicity, I'm omitting the radial gradient directly on this container.
//                           border: Border.all(
//                             color: Colors.white.withOpacity(0.3),
//                             width: 1.0,
//                           ),
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min, // To wrap content
//                           children: [
//                             Row(
//                               children: [
//                                 const Text(
//                                   "Nobu Doha",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 const Spacer(),
//                                 Row(
//                                   verticalDirection: VerticalDirection.up, // Aligns content to top if text baseline differs
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     const Icon(
//                                       Icons.star,
//                                       color: Color(0xFFFFCD1A),
//                                       size: 12,
//                                     ),
//                                     const SizedBox(width: 4),
//                                     Text(
//                                       4.4.toString(),
//                                       style: const TextStyle(
//                                         color: Color(0xFFFFCD1A),
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                     const Text(
//                                       " (532)",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 4),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.location_on,
//                                       color: Colors.white.withOpacity(0.8),
//                                       size: 16,
//                                     ),
//                                     const SizedBox(width: 4),
//                                     const Text(
//                                       "504 Corniche Rode",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.normal,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const Spacer(),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     const Text(
//                                       "300 - 500 QAR",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 4),
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
//                                       decoration: BoxDecoration(
//                                         color: Colors.white.withOpacity(0.3),
//                                         borderRadius: BorderRadius.circular(12.0),
//                                         border: Border.all(
//                                           color: Colors.white.withOpacity(0.4),
//                                           width: 0.5,
//                                         ),
//                                       ),
//                                       child: Text(
//                                         "Recommended For You",
//                                         style: TextStyle(
//                                           color: Colors.white.withOpacity(0.9),
//                                           fontSize: 6,
//                                           fontWeight: FontWeight.normal,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }