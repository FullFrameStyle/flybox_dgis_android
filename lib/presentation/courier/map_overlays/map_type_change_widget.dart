import 'package:flutter/material.dart';

import '../../../data/constants/values.dart';

class MapTypeChangeWidget extends StatelessWidget {
  const MapTypeChangeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(defaultPadding * 0.75),
        onTap: () {},
        child: Ink(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(defaultPadding * 0.75),
          ),
          height: 56,
          width: 56,
          child: Icon(
            Icons.navigation_rounded,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
      ),
    );
  }
}
