import 'package:flutter/material.dart';
import 'package:mohammed_swafvan_portfolio/constants/custom_colors.dart';
import 'package:mohammed_swafvan_portfolio/constants/experience_items.dart';
import 'package:mohammed_swafvan_portfolio/constants/height_width.dart';
import 'package:mohammed_swafvan_portfolio/widgets/experience_card_widget.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.all(32).copyWith(bottom: 80),
      child: Column(
        children: [
          // Title
          const Text(
            "Experience",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColors.whitePrimary,
            ),
          ),
          Heightwidth.hight20,

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  for (int i = 0; i < ExperienceItems.experiences.length; i++)
                    ExperienceCardWidget(
                      index: i,
                      experiences: ExperienceItems.experiences[i],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
