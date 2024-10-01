import 'package:flutter/material.dart';

class TopLoginWidget extends StatelessWidget {
  final String? title;
  final Widget? image;
  final Widget? child;
  final TextStyle? titleStyle;
  const TopLoginWidget({
    super.key,
    this.title,
    this.image,
    this.child,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return child ??
        Column(
          children: [
            if (image != null) image!,
            if (image != null) const SizedBox(height: 20),
            Text(
              title ?? 'Welcome',
              style: const TextStyle(color: Colors.black, fontSize: 30),
              // style: titleStyle ?? Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24)
          ],
        );
  }
}
