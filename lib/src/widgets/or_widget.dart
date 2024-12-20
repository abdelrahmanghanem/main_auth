import 'package:flutter/material.dart';
import 'package:smart_localize/smart_localize.dart';

class OrWidget extends StatelessWidget {
  final Color color;
  final TextStyle? style;
  const OrWidget({super.key, this.color = Colors.grey, this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 10,
            thickness: 1.5,
            color: color,
          ),
        ),
        Text(
          SmartLocalize.or,
          style: style ??
              Theme.of(context).textTheme.bodySmall!.copyWith(color: color),
        ),
        Expanded(
          child: Divider(
            indent: 10,
            thickness: 1.5,
            color: color,
          ),
        ),
      ],
    );
  }
}
