import 'package:flutter/material.dart';
import 'package:flybox/data/constants/values.dart';
import 'package:flybox/presentation/courier/map_overlays/courier_bonus_progress_widget.dart';
import 'package:flybox/presentation/courier/map_overlays/courier_status_change_widget.dart';

import 'map_layer/map.dart';
import 'map_overlays/navifation_mode_widget.dart';
import 'pages/shift/courier_shift_modal_widget.dart';
import 'map_overlays/map_layers_change_widget.dart';
import 'map_overlays/map_zoom_change_widget.dart';

class CourierMainPageWidget extends StatelessWidget {
  const CourierMainPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          MapWidget(),
          CourierInterfaceWidget(),
        ],
      ),
      drawer: Drawer(
        surfaceTintColor: Colors.transparent,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {},
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(12)),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Container(
                          height: 56,
                          width: 56,
                          color: Colors.black26,
                          child: Image.asset(
                            'assets/images/user.png',
                            height: 56,
                            width: 56,
                          ),
                        ),
                      ),
                      const SizedBox(width: defaultPadding / 2),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Сергеев Александр",
                            style: TextStyle(
                              fontSize: h3,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Рейтинг: 4.97",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 0),
              ListTile(
                title: const Text("Баланс"),
                trailing: Text(
                  "23 556 тг",
                  style: TextStyle(
                    fontSize: h3,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                onTap: () {},
              ),
              const Divider(height: 0),
              ListTile(
                title: const Text("Статистика"),
                onTap: () {},
              ),
              const Divider(height: 0),
              ListTile(
                title: const Text("Информация"),
                onTap: () {},
              ),
              const Divider(height: 0),
              ListTile(
                title: const Text("Служба поддержки"),
                onTap: () {},
              ),
              const Divider(height: 0),
              ListTile(
                title: const Text("Настройки"),
                onTap: () {},
              ),
              const Spacer(),
              ListTile(
                title: const Text("Выйти из аккаунта"),
                trailing: const Icon(Icons.exit_to_app_rounded),
                onTap: () {},
              ),
              const SizedBox(height: defaultPadding * 1.25)
            ],
          ),
        ),
      ),
    );
  }
}

class CourierInterfaceWidget extends StatelessWidget {
  const CourierInterfaceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CourierBonusProgressWidget(),
                Expanded(
                  child: CourierStatusChangeWidget(),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  MapLayersChangeWidget(),
                  MapZoomChangeWidget()
                ],
              ),
            ),
            const NavigationModeChangeWidget(),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            const CustomButtomNavigationBar(),
          ],
        ),
      ),
    );
  }
}

class CustomButtomNavigationBar extends StatelessWidget {
  const CustomButtomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inverseSurface,
          borderRadius: BorderRadius.circular(defaultPadding * 0.75),
        ),
        height: 72,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: defaultPadding * 1.5),
            BottomBarButtonsWidget(
              icon: Icons.grid_view_rounded,
              label: 'Меню',
              onTap: () => Scaffold.of(context).openDrawer(),
            ),
            const Spacer(),
            BottomBarButtonsWidget(
              icon: Icons.timelapse_rounded,
              label: 'Предзаказы',
              onTap: () {},
            ),
            const Spacer(),
            BottomBarButtonsWidget(
              icon: Icons.delivery_dining_rounded,
              label: 'Смена',
              onTap: () => showModalBottomSheet(
                elevation: 0,
                context: context,
                builder: (context) => const CourierShiftModalWidget(),
                isScrollControlled: true,
              ),
            ),
            const SizedBox(width: defaultPadding * 1.5),
          ],
        ),
      ),
    );
  }
}

class BottomBarButtonsWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function() onTap;
  const BottomBarButtonsWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      borderRadius: BorderRadius.circular(24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 64, minHeight: 68),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 28,
                color: Theme.of(context).colorScheme.surface,
              ),
              Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                ),
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
