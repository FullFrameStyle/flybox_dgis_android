import 'package:flutter/material.dart';

import '../../../data/constants/values.dart';

class MapLayersChangeWidget extends StatelessWidget {
  const MapLayersChangeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(defaultPadding * 0.75),
        onTap: () => showModalBottomSheet(
          elevation: 0,
          context: context,
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: Container(
                  height: 4,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: defaultPadding / 2),
                child: Text(
                  'Слои на карте',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              const LayerCheckBoxListTileWIdget(
                icon: Icons.traffic_rounded,
                name: "Пробки",
              ),
              const LayerCheckBoxListTileWIdget(
                icon: Icons.local_parking_rounded,
                name: "Парковки",
              ),
              const LayerCheckBoxListTileWIdget(
                icon: Icons.local_gas_station_rounded,
                name: "Заправки",
              ),
              Row()
            ],
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(defaultPadding * 0.75),
          ),
          height: 56,
          width: 56,
          child: Icon(
            Icons.layers,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
      ),
    );
  }
}

class LayerCheckBoxListTileWIdget extends StatefulWidget {
  final String name;
  final IconData icon;

  const LayerCheckBoxListTileWIdget({
    super.key,
    required this.name,
    required this.icon,
  });

  @override
  State<LayerCheckBoxListTileWIdget> createState() =>
      _LayerCheckBoxListTileWIdgetState();
}

class _LayerCheckBoxListTileWIdgetState
    extends State<LayerCheckBoxListTileWIdget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        defaultPadding,
        0,
        defaultPadding,
        defaultPadding / 2,
      ),
      child: InkWell(
        onTap: () => setState(() {
          selected = !selected;
        }),
        borderRadius: BorderRadius.circular(
          defaultPadding * 0.75,
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              defaultPadding * 0.75,
            ),
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Icon(
                      widget.icon,
                      size: 24,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ],
              ),
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  activeColor: Theme.of(context).colorScheme.surface,
                  checkColor: Theme.of(context).colorScheme.inverseSurface,
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.surface, width: 1.5),
                  value: selected,
                  shape: const CircleBorder(),
                  onChanged: (val) => setState(() {
                    selected = !selected;
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
