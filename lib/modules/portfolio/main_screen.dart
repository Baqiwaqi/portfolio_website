import 'package:flutter/material.dart';
import 'package:portfolio_website_app/config/themes/constants.dart';
import 'package:portfolio_website_app/modules/side_menu/widgets/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
    required this.widgtes,
  }) : super(key: key);

  final List<Widget> widgtes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 2,
            child: SideMenu(),
          ),
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: Padding(
                // padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                padding: const EdgeInsets.all(halfPadding),
                child: Column(
                  children: [...widgtes],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
