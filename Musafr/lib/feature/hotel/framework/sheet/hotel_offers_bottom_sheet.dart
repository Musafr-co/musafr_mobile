
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/core/view/ui_state/ui_state.dart';
import 'package:musafr/feature/hotel/domain/repository/hotel_repository.dart';
import 'package:musafr/feature/hotel/framework/view_model/hotel_offer_cubit.dart';
import 'package:musafr/feature/hotel/framework/view_model/hotel_offer_state.dart';
import 'package:musafr/feature/hotel/data/modal/hotel_offer_response_dto.dart';

import '../../../../core/view/widgets/top_handle_view/top_handle_view.dart';

class HotelOffersBottomSheet extends StatefulWidget {
  final String hotelId;
  final String checkInDate;
  final int guests;
  final int roomQuantity;

  const HotelOffersBottomSheet({
    super.key,
    required this.hotelId,
    required this.checkInDate,
    required this.guests,
    required this.roomQuantity,
  });

  @override
  State<HotelOffersBottomSheet> createState() => _HotelOffersBottomSheetState();
}

class _HotelOffersBottomSheetState extends State<HotelOffersBottomSheet> {
  bool _descriptionExpanded = false;
  final Map<String, bool> _faqExpanded = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelOfferCubit(
        context.read<HotelRepository>(),
        hotelId: widget.hotelId,
        checkInDate: widget.checkInDate,
        guests: widget.guests,
        roomQuantity: widget.roomQuantity,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: BlocBuilder<HotelOfferCubit, HotelOfferState>(
          builder: (context, state) {
            if (state.screenState is UiLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.screenState is UiSuccess) {
              final data = (state.screenState as UiSuccess).data;
              final hotel = data.hotel;
              final offers = data.offers ?? [];

              return Column(
                children: [
                  const SizedBox(height: 12),
                  const TopHandle(),
                  const SizedBox(height: 12),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Hotel Image Carousel
                          _buildImageCarousel(hotel),
                          
                          // Hotel Name, Rating, Description
                          _buildHotelHeader(hotel),
                          
                          // Amenities
                          _buildAmenities(hotel),
                          
                          // Rooms Section
                          _buildRoomsSection(context, offers, state),
                          
                          // Address/Map
                          _buildAddressSection(hotel),
                          
                          // House Rules
                          _buildHouseRules(),
                          
                          // FAQs
                          _buildFAQs(),
                          
                          // Back to Chat Button
                          _buildBackToChatButton(context),
                          
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  // Total Price Footer
                  _buildTotalPriceFooter(state),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildImageCarousel(HotelDto? hotel) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/cafe.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          // Star Rating Badge
          Positioned(
            top: 16,
            left: 32,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "${(hotel?.rating ?? 2) >= 4 ? '4' : '2'} Star Hotel",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          // Favorite Icon
          Positioned(
            top: 16,
            right: 32,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.favorite_border, color: Colors.blue),
            ),
          ),
          // Page Indicators
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: index == 0 ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: index == 0 ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHotelHeader(HotelDto? hotel) {
    final description = "Nobu Doha is a luxury hotel located near the Corniche in Doha, the capital city of Qatar. This hotel is inspired by the famous Japanese chef...";
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  hotel?.name ?? "Hotel Name",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(width: 4),
              Text(
                "${hotel?.rating ?? 4.4} (532)",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _descriptionExpanded ? description : description.substring(0, 120) + "...",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _descriptionExpanded = !_descriptionExpanded),
            child: Row(
              children: [
                Text(
                  _descriptionExpanded ? "Read less" : "Read more",
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Icon(
                  _descriptionExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.blue,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenities(HotelDto? hotel) {
    final amenities = [
      {'icon': Icons.local_parking, 'label': 'Parking'},
      {'icon': Icons.spa, 'label': 'Spa'},
      {'icon': Icons.pool, 'label': 'Pool'},
      {'icon': Icons.restaurant, 'label': 'Dinner'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Amenities",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: amenities.map((amenity) {
              return Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(amenity['icon'] as IconData, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    amenity['label'] as String,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildRoomsSection(BuildContext context, List<OfferDto> offers, HotelOfferState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Rooms",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ...offers.map((offer) => _buildRoomCard(context, offer, state)),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildRoomCard(BuildContext context, OfferDto offer, HotelOfferState state) {
    final quantity = state.roomQuantities[offer.offerId] ?? 0;
    final amenityIcons = [
      Icons.local_cafe_outlined,
      Icons.shower_outlined,
      Icons.ac_unit_outlined,
      if ((offer.guests ?? 0) >= 2) Icons.tv_outlined,
      if ((offer.guests ?? 0) >= 2) Icons.wifi_outlined,
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Room Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/cafe.jpg',
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Room Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        offer.roomType ?? "Room",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Icon(Icons.person_outline, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      "${offer.guests ?? 1}",
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Amenity Icons
                Row(
                  children: amenityIcons.take(4).map((icon) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(icon, size: 18, color: Colors.grey[600]),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                // Quantity and Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Quantity Selector
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => context.read<HotelOfferCubit>().decrementRoomQuantity(offer.offerId ?? ""),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: const Icon(Icons.remove, size: 18),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "$quantity",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => context.read<HotelOfferCubit>().incrementRoomQuantity(offer.offerId ?? ""),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: const Icon(Icons.add, size: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${offer.totalPrice ?? offer.bestPrice ?? 0}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          offer.currency ?? "QAR",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const Text(
                          "Per Night",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressSection(HotelDto? hotel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Address",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(Icons.map, size: 48, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${hotel?.addressLine ?? '23979, West Bay Lagoon'}, ${hotel?.cityName ?? 'Doha'}, ${hotel?.countryCode ?? 'Qatar'}.",
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHouseRules() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "House Rules",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildRuleItem(Icons.login, "Check In", "09:00 AM"),
              ),
              Expanded(
                child: _buildRuleItem(Icons.logout, "Check Out", "12:00 PM"),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildRuleItem(Icons.pets, "Pets", "No"),
              ),
              Expanded(
                child: _buildRuleItem(Icons.smoking_rooms, "Smoking", "No"),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildRuleItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFAQs() {
    final faqs = [
      {
        'question': 'Signature Nobu dining',
        'answer': 'Morbi adipiscing gravida dolor dui tincidunt libero. Duis malesuada massa libero nec',
      },
      {
        'question': 'Corniche, Souq Waqif, museums.',
        'answer': 'Experience the best of Doha with easy access to major attractions.',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "FAQ's",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ...faqs.map((faq) {
            final question = faq['question']!;
            final isExpanded = _faqExpanded[question] ?? false;
            
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _faqExpanded[question] = !isExpanded;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              question,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isExpanded)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      child: Text(
                        faq['answer']!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                ],
              ),
            );
          }),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildBackToChatButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Back To Chat",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTotalPriceFooter(HotelOfferState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total Price",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "${state.totalPrice.toInt()} QAR",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

void showHotelOffersBottomSheet(
  BuildContext context, {
  required String hotelId,
  required String checkInDate,
  required int guests,
  required int roomQuantity,
}) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      final double screenHeight = MediaQuery.of(context).size.height;
      return SizedBox(
        height: screenHeight * 0.95,
        child: HotelOffersBottomSheet(
          hotelId: hotelId,
          checkInDate: checkInDate,
          guests: guests,
          roomQuantity: roomQuantity,
        ),
      );
    },
  );
}
