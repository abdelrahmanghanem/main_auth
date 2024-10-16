import 'package:flutter/material.dart';

import '../../main_auth.dart';

class TermsWidget extends StatelessWidget {
  final void Function()? onTermsTap;
  final void Function()? onPrivacyTap;
  const TermsWidget({
    super.key,
    this.onTermsTap,
    this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        NormalTextWidget(
          title: SmartLocalize.byRegistering,
        ),
        const SizedBox(width: 8),
        BoldTextWidget(
          title: SmartLocalize.termsOfService,
          onTap: onTermsTap,
        ),
        const SizedBox(width: 6),
        NormalTextWidget(
          title: SmartLocalize.and,
        ),
        const SizedBox(width: 6),
        BoldTextWidget(
          title: SmartLocalize.privacyPolicy,
          onTap: onPrivacyTap,
        ),
      ],
    );
  }
}

class NormalTextWidget extends StatelessWidget {
  final String title;
  const NormalTextWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}

class BoldTextWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const BoldTextWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 11),
      ),
    );
  }
}
