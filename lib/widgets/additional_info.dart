import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final String additionalInfo;
  final Icon icon;

  const AdditionalInfo({
    required this.additionalInfo,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(additionalInfo),
          ),
        ],
      ),
    );
  }
}
