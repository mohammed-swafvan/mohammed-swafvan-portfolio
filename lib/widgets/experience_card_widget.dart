import 'package:flutter/material.dart';
import 'package:mohammed_swafvan_portfolio/constants/custom_colors.dart';
import 'package:mohammed_swafvan_portfolio/constants/height_width.dart';
import 'package:mohammed_swafvan_portfolio/widgets/on_mouse_hover_widget.dart';

import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceCardWidget extends StatelessWidget {
  const ExperienceCardWidget({
    super.key,
    required this.index,
    required this.experiences,
  });
  final int index;
  final Map<String, dynamic> experiences;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: OnMouseHoverWidget(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 520,
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CustomColors.bgLight2,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => openWebsite(experiences["website"]),
                      child: Text(
                        experiences["company"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      experiences["duration"],
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: CustomColors.yellowPrimay,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Heightwidth.hight5,
                Text(
                  experiences["designation"],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: CustomColors.whitePrimary.withOpacity(0.95),
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15,
                  ),
                ),
                Heightwidth.hight5,
                ReadMoreText(
                  experiences["description"],
                  trimLines: 4,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "view all",
                  trimExpandedText: "hide",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: CustomColors.whiteSecondary,
                    fontSize: 14,
                  ),
                  lessStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: CustomColors.yellowPrimay.withOpacity(0.6),
                    fontSize: 10,
                    decoration: TextDecoration.underline,
                    decorationColor: CustomColors.yellowPrimay.withOpacity(0.6),
                  ),
                  moreStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: CustomColors.yellowPrimay.withOpacity(0.6),
                    fontSize: 10,
                    decoration: TextDecoration.underline,
                    decorationColor: CustomColors.yellowPrimay.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> openWebsite(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception("Failed to launch $url");
    }
  }
}
