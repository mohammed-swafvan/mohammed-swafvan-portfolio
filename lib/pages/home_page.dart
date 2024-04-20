import 'package:flutter/material.dart';
import 'package:mohammed_swafvan_portfolio/constants/custom_colors.dart';
import 'package:mohammed_swafvan_portfolio/constants/custom_size.dart';
import 'package:mohammed_swafvan_portfolio/constants/height_width.dart';
import 'package:mohammed_swafvan_portfolio/widgets/contact_section.dart';
import 'package:mohammed_swafvan_portfolio/widgets/drawer_mobile.dart';
import 'package:mohammed_swafvan_portfolio/widgets/experience_section.dart';
import 'package:mohammed_swafvan_portfolio/widgets/footer.dart';
import 'package:mohammed_swafvan_portfolio/widgets/header_desktop.dart';
import 'package:mohammed_swafvan_portfolio/widgets/header_mobile.dart';
import 'package:mohammed_swafvan_portfolio/widgets/main_desktop.dart';
import 'package:mohammed_swafvan_portfolio/widgets/main_mobile.dart';
import 'package:mohammed_swafvan_portfolio/widgets/hobby_project_section.dart';
import 'package:mohammed_swafvan_portfolio/widgets/skills_desktop.dart';
import 'package:mohammed_swafvan_portfolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColors.scaffoldBg,
        endDrawer: constraints.maxWidth < CustomSize.minDesktopWidth
            ? DrawerMobile(
                onNavitemTap: (int navIndex) {
                  scaffoldKey.currentState!.closeEndDrawer();
                  scrollToSection(navIndex);
                },
              )
            : null,
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              /// Header Section
              if (constraints.maxWidth >= CustomSize.minDesktopWidth)
                HeaderDesktop(
                  onNavitemTap: (int navIndex) {
                    scrollToSection(navIndex);
                  },
                )
              else
                HeaderMobile(
                  onlogoTap: () {},
                  onMenutap: () {
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                ),

              /// Main Section
              SizedBox(key: navbarKeys[0]),
              if (constraints.maxWidth >= CustomSize.minDesktopWidth)
                MainDesktop(
                  onGetInTouch: () {
                    scrollToSection(3);
                  },
                )
              else
                MainMobile(
                  onGetInTouch: () {
                    scrollToSection(3);
                  },
                ),

              /// Skills Section
              SizedBox(key: navbarKeys[1]),
              if (constraints.maxWidth >= CustomSize.minDesktopWidth) const SkillsDesktop() else const SkillsMobile(),

              Heightwidth.hight20,

              /// Experience Section
              ExperienceSection(key: navbarKeys[2]),

              Heightwidth.hight20,

              /// Hobby Project Section
              HobbyProjectSection(key: navbarKeys[3]),

              Heightwidth.hight20,

              /// Contact Section
              ContactSection(key: navbarKeys[4]),

              /// Footer Section
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    final GlobalKey key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
