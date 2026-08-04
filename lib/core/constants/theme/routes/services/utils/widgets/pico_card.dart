import 'package:flutter/material.dart';
import 'package:pico_finder/core/constants/theme/routes/services/utils/app_colors.dart';



class PicoCard extends StatelessWidget {
final String imageUrl;
final String name;
final String type;
final double rating;
final String location;
final String level;
final VoidCallback onTap;

const PicoCard({
  super.key,
  required this.imageUrl,
  required this.name,
  required this.type,
  required this.rating,
  required this.location,
  required this.level,
  required this.onTap,
});
@override
Widget build(BuildContext context){
  final theme = Theme.of(context);
  return GestureDetector(
    onTap: onTap,
    child: Card(
     margin: const EdgeInsets.all(8),
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 3,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: Image.asset(
          imageUrl,
          height: 160,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
       padding: const EdgeInsets.all(12),
       child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(type),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star,size: 16, color: AppColors.ratingColor),
              const SizedBox(width: 4),
              Text(rating.toStringAsFixed(1)),
              const Spacer(),
              Text(level)
            ],
          ),
          const SizedBox(height: 4),
          Text(location),
        ],
       ),
       ),
    ],
    ),
    ),
  );
}
}