import 'package:dgis_flutter/dgis_flutter.dart';
import 'package:flutter/material.dart';

import '../../../data/constants/values.dart';

class NavigationModeChangeWidget extends StatelessWidget {
  const NavigationModeChangeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GisMapController controller = GisMapController();

    return SizedBox(
      child: Card(
        elevation: 5,
        surfaceTintColor: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(defaultPadding * 0.75),
          onTap: () async {
            controller.getCurrentPosition();
          },
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
      ),
    );
  }
}
