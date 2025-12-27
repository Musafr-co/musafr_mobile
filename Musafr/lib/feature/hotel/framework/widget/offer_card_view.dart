
import 'package:flutter/material.dart';
import 'package:musafr/core/view/color/color.dart';
import '../../data/modal/hotel_offer_response_dto.dart';

class OfferCardView extends StatelessWidget {
  final OfferDto offer;

  const OfferCardView({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  offer.roomType ?? "Room",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: pillBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "${offer.totalPrice ?? offer.bestPrice ?? 0} ${offer.currency ?? "USD"}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: pillTextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            offer.roomDescription ?? "No description available",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.person, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                "${offer.guests ?? 1} Guests",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.info_outline, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  offer.cancellationDescription ?? offer.cancellationType ?? "",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
