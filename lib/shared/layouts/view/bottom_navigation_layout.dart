import 'package:flutter/material.dart';

class BottomNavigationLayout extends StatelessWidget {
  final Widget body;
  final List<Widget> destinations;
  final int selectedIndex;
  final void Function(int) onDestinationSelected;
  // final Widget Function(BuildContext, ScrollController) bottomSheetBuilder;

  const BottomNavigationLayout({
    super.key,
    required this.body,
    required this.destinations,
    required this.onDestinationSelected,
    // required this.bottomSheetBuilder,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          destinations: destinations
      )
    );
  }
}
