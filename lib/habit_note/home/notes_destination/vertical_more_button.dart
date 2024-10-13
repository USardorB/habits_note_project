import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/colors.dart';
import 'package:flutter_application_1/extensions/build_context.dart';

class VerticalMoreBtton extends StatelessWidget {
  final Function(int) onColorSelected;
  const VerticalMoreBtton({super.key, required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).showBottomSheet(
          backgroundColor: bgColor,
          (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  contentPadding: EdgeInsets.all(24),
                  leading: Icon(Icons.delete_outline, size: 36),
                  title: Text('Delete note'),
                  shape: UnderlineInputBorder(),
                ),
                Text('Select Color', style: context.textTheme.titleLarge),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 52,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 14,
                  ),
                  itemBuilder: (context, index) {
                    return MaterialButton(
                      onPressed: () {
                        onColorSelected(index);
                        Navigator.pop(context);
                      },
                      color: filterColors.elementAt(index),
                      shape: CircleBorder(
                        side: filterColors[index] == secondaryColor
                            ? const BorderSide()
                            : BorderSide.none,
                      ),
                    );
                  },
                  itemCount: 12,
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.more_vert),
    );
  }
}
