import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';

Future<Color?> showColorFilter(BuildContext context) async => await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter by color'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                shape: const StadiumBorder(side: BorderSide()),
              ),
              child: const Text('Reset'),
            ),
            SizedBox(
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
            )
          ],
        ),
      ),
    );
