import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mohammed_swafvan_portfolio/styles/style.dart';
import 'package:mohammed_swafvan_portfolio/widgets/on_mouse_hover_widget.dart';
import 'package:mohammed_swafvan_portfolio/widgets/website_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onMenutap, this.onlogoTap});
  final VoidCallback? onlogoTap;
  final VoidCallback? onMenutap;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1500),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 22),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        width: double.maxFinite,
        decoration: Style.navBarDecoration,
        child: Row(
          children: [
            WebsiteLogo(
              onTap: onlogoTap,
            ),
            const Spacer(),
            OnMouseHoverWidget(
              child: IconButton(
                onPressed: onMenutap,
                icon: const Icon(Icons.menu),
              ),
            )
          ],
        ),
      ),
    );
  }
}
