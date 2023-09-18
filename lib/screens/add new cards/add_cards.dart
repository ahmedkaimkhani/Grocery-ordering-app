import 'package:flutter/material.dart';
import 'package:grocery_order_app_flutter/widgets/custom_appbar.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomWhiteAppBar(
            title: 'Add Card',
          )
        ],
      ),
    );
  }
}
