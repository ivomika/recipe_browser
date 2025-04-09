import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
            if(constraints.maxWidth <= 480){
              return Image.asset(
                  'assets/not_found/not_found_mobile.png',
                  fit: BoxFit.cover,
              );
            }

            if(constraints.maxWidth <= 768){
              return Image.asset(
                'assets/not_found/not_found_tablet.png',
                fit: BoxFit.cover,
              );
            }

            return Image.asset(
              'assets/not_found/not_found_desktop.png',
              fit: BoxFit.cover,
            );
        }
    );
  }
}
