// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:delivery_app/src/core/ui/styles/colors_app.dart';
import 'package:delivery_app/src/core/ui/styles/text_styles.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  final int amout;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;

  const DeliveryIncrementDecrementButton({
    super.key,
    required this.amout,
    required this.incrementTap,
    required this.decrementTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '-',
                style: context.textStyles.textMedium
                    .copyWith(fontSize: 22, color: Colors.grey),
              ),
            ),
            onTap: decrementTap,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              amout.toString(),
              style: context.textStyles.textRegular
                  .copyWith(fontSize: 17, color: context.colors.secondary),
            ),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '+',
                style: context.textStyles.textMedium
                    .copyWith(fontSize: 22, color: context.colors.secondary),
              ),
            ),
            onTap: incrementTap,
          )
        ],
      ),
    );
  }
}
