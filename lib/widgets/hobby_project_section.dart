import 'package:flutter/material.dart';
import 'package:mohammed_swafvan_portfolio/constants/custom_colors.dart';
import 'package:mohammed_swafvan_portfolio/constants/height_width.dart';
import 'package:mohammed_swafvan_portfolio/utils/project_utils.dart';
import 'package:mohammed_swafvan_portfolio/widgets/hobby_project_card_widget.dart';

class HobbyProjectSection extends StatelessWidget {
  const HobbyProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.all(32).copyWith(bottom: 80),
      color: CustomColors.bgLight1,
      child: Column(
        children: [
          //Title
          const Text(
            "Hobby Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColors.whitePrimary,
            ),
          ),
          Heightwidth.hight40,
          //Project Cards
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900,
            ),
            child: Wrap(
              spacing: 28,
              runSpacing: 28,
              children: [
                for (int i = 0; i < mainProjectsList.length; i++)
                  HobbyProjectCardWidget(
                    project: mainProjectsList[i],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
