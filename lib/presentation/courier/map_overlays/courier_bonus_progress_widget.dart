import 'package:flutter/material.dart';
import 'package:flybox/data/constants/values.dart';

class CourierBonusProgressWidget extends StatelessWidget {
  const CourierBonusProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.transparent,
      child: InkWell(
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
                  'Бонусы',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(
                  defaultPadding,
                  0,
                  defaultPadding,
                  defaultPadding / 2,
                ),
                child: Text(
                  'Выполните нужное количество заказов за смену и получите бонус на свой счет.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(
                  defaultPadding,
                  0,
                  defaultPadding,
                  defaultPadding / 2,
                ),
                child: Text(
                  'БОЛЬШЕ ЗАКАЗОВ = БОЛЬШЕ БОНУСОВ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const BonusesViewWidget()
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(defaultPadding * 0.75),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inverseSurface,
            borderRadius: BorderRadius.circular(defaultPadding * 0.75),
          ),
          height: 72,
          child: Center(
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white24,
                      ),
                      height: 6,
                      width: 24,
                    ),
                    const SizedBox(
                      height: defaultPadding / 4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white24,
                      ),
                      height: 6,
                      width: 24,
                    ),
                    const SizedBox(
                      height: defaultPadding / 4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.amber,
                      ),
                      height: 6,
                      width: 24,
                    )
                  ],
                ),
                const SizedBox(
                  width: defaultPadding / 2,
                ),
                Text(
                  "0/25",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BonusesViewWidget extends StatefulWidget {
  const BonusesViewWidget({
    super.key,
  });

  @override
  State<BonusesViewWidget> createState() => _BonusesViewWidgetState();
}

class _BonusesViewWidgetState extends State<BonusesViewWidget> {
  int currentIndex = -1, previousIndex = 0;

  double getAnimationValue(int currentIndex, int widgetIndex, int previousIndex,
      {bool begin = true}) {
    if (widgetIndex == currentIndex) {
      return begin ? 0.9 : 1;
    } else {
      return begin ? 1 : 0.9;
    }
  }

  Map<int, Widget> bonuses = {
    0: const BonusCardWidget(
      name: "Легкий старт",
      completedDeliveries: "0",
      requiredDeliveries: "25",
      level: 1,
      reward: "3000",
    ),
    1: const BonusCardWidget(
      name: "Рабочий день",
      completedDeliveries: "0",
      requiredDeliveries: "50",
      level: 2,
      reward: "6000",
    ),
    2: const BonusCardWidget(
      name: "Полная смена",
      completedDeliveries: "0",
      requiredDeliveries: "75",
      level: 3,
      reward: "9000",
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Center(
            child: PageView.builder(
              itemCount: 3,
              controller: PageController(viewportFraction: 0.95),
              onPageChanged: (int index) {
                setState(() {
                  if (currentIndex != -1) {
                    previousIndex = currentIndex;
                  }
                  currentIndex = index;
                });
              },
              itemBuilder: (_, widgetIndex) {
                return (currentIndex != -1 &&
                        (previousIndex == widgetIndex ||
                            widgetIndex == currentIndex))
                    ? TweenAnimationBuilder(
                        duration: const Duration(milliseconds: 300),
                        tween: Tween<double>(
                          begin: getAnimationValue(
                            currentIndex,
                            widgetIndex,
                            previousIndex,
                          ),
                          end: getAnimationValue(
                            currentIndex,
                            widgetIndex,
                            previousIndex,
                            begin: false,
                          ),
                        ),
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: bonuses[widgetIndex],
                          );
                        },
                      )
                    : Transform.scale(
                        scale:
                            (widgetIndex == 0 && currentIndex == -1) ? 1 : 0.9,
                        child: bonuses[widgetIndex],
                      );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            defaultPadding * 2,
            defaultPadding / 2,
            defaultPadding * 2,
            defaultPadding,
          ),
          child: Row(
            children: List.generate(
              3,
              (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding / 2,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: currentIndex == index ||
                                currentIndex == -1 && index == 0
                            ? 1
                            : 0,
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BonusCardWidget extends StatelessWidget {
  final String name;
  final String requiredDeliveries;
  final String completedDeliveries;
  final int level;
  final String reward;

  const BonusCardWidget({
    super.key,
    required this.name,
    required this.requiredDeliveries,
    required this.completedDeliveries,
    required this.level,
    required this.reward,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inverseSurface,
          borderRadius: BorderRadius.circular(defaultPadding * 0.75),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: level >= 3 ? Colors.amber : Colors.white24,
                    ),
                    height: 9,
                    width: 36,
                  ),
                  const SizedBox(
                    height: defaultPadding / 3,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: level >= 2 ? Colors.amber : Colors.white24,
                    ),
                    height: 9,
                    width: 36,
                  ),
                  const SizedBox(
                    height: defaultPadding / 3,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: level >= 1 ? Colors.amber : Colors.white24,
                    ),
                    height: 9,
                    width: 36,
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  Text(
                    "Прогресс: $completedDeliveries/$requiredDeliveries",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: Text(
                "$reward т",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
