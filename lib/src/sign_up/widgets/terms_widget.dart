import 'package:flutter/material.dart';

import '../../../main_auth.dart';

class TermsWidget extends StatelessWidget {
  final void Function()? onTermsTap;
  final void Function()? onPrivacyTap;
  final bool hideTerms;
  const TermsWidget({
    super.key,
    this.onTermsTap,
    this.hideTerms = false,
    this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return hideTerms
        ? const SizedBox.shrink()
        : Wrap(
            children: [
              const NormalTextWidget(
                title: 'by_registering',
                subtitle: 'By registering in the application, you agree to',
              ),
              BoldTextWidget(
                title: 'terms_conditions',
                subtitle: 'Terms and conditions',
                onTap: onTermsTap,
              ),
              const SizedBox(width: 4),
              const NormalTextWidget(title: 'and_', subtitle: 'And'),
              const SizedBox(width: 4),
              BoldTextWidget(
                title: 'privacy_policy',
                subtitle: 'Privacy policy',
                onTap: onPrivacyTap,
              ),
            ],
          );
  }
}

class NormalTextWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const NormalTextWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      AuthMessage(key: title).localize(context) ?? subtitle,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}

class BoldTextWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function()? onTap;
  const BoldTextWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        AuthMessage(key: title).localize(context) ?? subtitle,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 11),
      ),
    );
  }
}
