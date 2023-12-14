import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/example/KitchenSink/models/customer_rating.dart';

class KSCustomerRating extends StatelessWidget {
  KSCustomerRating({super.key});

  final List<CustomerRatingModel> _customerRatingData = [
    CustomerRatingModel(
      label: "5 stars",
      value: "5 stars",
    ),
    CustomerRatingModel(
      label: "4+ stars",
      value: "5+ stars",
    ),
    CustomerRatingModel(
      label: "3+ stars",
      value: "3+ stars",
    ),
    CustomerRatingModel(
      label: "2+ stars",
      value: "2+ stars",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GSVStack(
      space: GSSpaces.$lg,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSHeading(
          text: "Customer Ratings",
          size: GSSizes.$sm,
        ),
        GSCheckBoxGroup(
            child: GSVStack(
          space: GSSpaces.$lg,
          children: [
            for (int i = 0; i < _customerRatingData.length; i++)
              GSCheckBox(
                size: GSSizes.$sm,
                onChanged: (value) {},
                icon: GSCheckBoxIndicator(
                    style: GSStyle(
                        margin:  EdgeInsets.only(right: $GSSpace.$2)),
                    child: const GSCheckBoxIcon()),
                value: _customerRatingData[i].value,
                label: GSHStack(
                  space: GSSpaces.$xs,
                  children: [
                    GSIcon(
                      style: GSStyle(
                          width: 12,
                          color: $GSColors.black,
                          dark: GSStyle(color: $GSColors.white)),
                      icon: Icons.star,
                    ),
                    GSCheckBoxLabel(text: _customerRatingData[i].label)
                  ],
                ),
              ),
          ],
        ))
      ],
    );
  }
}
