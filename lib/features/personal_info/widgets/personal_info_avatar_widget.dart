import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

class PersonalInfoAvatar extends StatelessWidget {
  final String? assetName;
  const PersonalInfoAvatar({super.key, this.assetName});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 125,
      backgroundColor: context.themeData.colorScheme.onSecondary,
      child: CircleAvatar(
        radius: 120,
        backgroundImage: AssetImage(assetName ?? ''),
      ),
    );
  }
}
