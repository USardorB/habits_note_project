import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/colors.dart';

Future<Color?> showColorFilter(BuildContext context) async => await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Filter by color'),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.filter_alt_off),
            ),
          ],
        ),
        content: SizedBox(
          height: 210,
          width: 350,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 7,
            ),
            itemBuilder: (context, index) {
              return MaterialButton(
                onPressed: () => Navigator.pop(
                  context,
                  filterColors[index],
                ),
                color: filterColors.elementAt(index),
                shape: StadiumBorder(
                  side: filterColors[index] == secondaryColor
                      ? const BorderSide()
                      : BorderSide.none,
                ),
              );
            },
            itemCount: 12,
          ),
        ),
      ),
    );
