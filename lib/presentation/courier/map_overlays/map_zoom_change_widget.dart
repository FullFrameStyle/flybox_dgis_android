import 'package:dgis_flutter/dgis_flutter.dart';
import 'package:flutter/material.dart';

import '../../../data/constants/values.dart';

class MapZoomChangeWidget extends StatelessWidget {
  const MapZoomChangeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GisMapController controller = GisMapController();

    return Card(
      elevation: 5,
      surfaceTintColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () async {
              await controller.increaseZoom(duration: 300);
            },
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(
                defaultPadding * 0.75,
              ),
              topLeft: Radius.circular(
                defaultPadding * 0.75,
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(
                    defaultPadding * 0.75,
                  ),
                  topLeft: Radius.circular(
                    defaultPadding * 0.75,
                  ),
                ),
              ),
              height: 56,
              width: 56,
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ),
          Container(
            height: 1,
            width: 56,
            color: Colors.black12,
          ),
          InkWell(
            onTap: () async {
              await controller.reduceZoom(duration: 300);
            },
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(
                defaultPadding * 0.75,
              ),
              bottomLeft: Radius.circular(
                defaultPadding * 0.75,
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(
                    defaultPadding * 0.75,
                  ),
                  bottomLeft: Radius.circular(
                    defaultPadding * 0.75,
                  ),
                ),
              ),
              height: 56,
              width: 56,
              child: Icon(
                Icons.remove,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
