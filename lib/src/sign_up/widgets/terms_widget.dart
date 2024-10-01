import 'package:flutter/material.dart';

import '../../../main_auth.dart';

class TermsWidget extends StatelessWidget {
  final void Function()? onTermsTap;
  final bool hideTerms;
  const TermsWidget({super.key, this.onTermsTap, this.hideTerms = false});

  @override
  Widget build(BuildContext context) {
    return hideTerms
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                AuthMessage(key: 'by_registering').localize(context) ??
                    'By registering in the application, you agree to',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              InkWell(
                onTap: onTermsTap,
                child: Text(
                  AuthMessage(key: 'terms_conditions').localize(context) ??
                      'terms and conditions',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          );
  }
}
