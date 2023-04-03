import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/constants/values.dart';
import '../../widgets/swipe_button_widget.dart';

class CourierStatusChangeWidget extends StatefulWidget {
  const CourierStatusChangeWidget({
    super.key,
  });

  @override
  State<CourierStatusChangeWidget> createState() =>
      _CourierStatusChangeWidgetState();
}

class _CourierStatusChangeWidgetState extends State<CourierStatusChangeWidget> {
  bool inLine = false;

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
                  'Статусы',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  defaultPadding,
                  0,
                  defaultPadding,
                  defaultPadding / 2,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'На линии',
                              style: TextStyle(
                                fontSize: h2,
                                fontWeight: FontWeight.w600,
                                color: Colors.green.shade400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            if (inLine) const Icon(Icons.done)
                          ],
                        ),
                        const Text(
                          'Вам предлагаются текушие заказы и доступна возможность брать предзаказы',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Занят',
                              style: TextStyle(
                                fontSize: h2,
                                fontWeight: FontWeight.w600,
                                color: Colors.red.shade400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            if (!inLine) const Icon(Icons.done)
                          ],
                        ),
                        const Text(
                          'Вам не предлагаются текушие заказы, но вы можете брать предзаказы',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: SwipeButton.expand(
                  thumb: Icon(
                    Icons.double_arrow_rounded,
                    color: inLine ? Colors.red.shade400 : Colors.green.shade400,
                  ),
                  activeThumbColor: Colors.white,
                  activeTrackColor:
                      inLine ? Colors.red.shade400 : Colors.green.shade400,
                  thumbPadding: const EdgeInsets.all(defaultPadding / 2),
                  onSwipe: () {
                    setState(() {
                      inLine = !inLine;
                    });
                    context.pop();
                  },
                  thumbEnd: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding / 2,
                      horizontal: defaultPadding / 4,
                    ),
                    child: Icon(
                      Icons.done_all,
                      color:
                          inLine ? Colors.red.shade400 : Colors.green.shade400,
                    ),
                  ),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 56,
                      ),
                      Text(
                        inLine ? "Занят" : "Выйти на линию",
                        style: const TextStyle(
                          fontSize: h2,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: Icon(
                          Icons.circle,
                          color: Colors.white30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding / 2)
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(defaultPadding * 0.75),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          decoration: BoxDecoration(
            gradient: LinearGradient(stops: const [
              0.94,
              0.02
            ], colors: [
              Theme.of(context).colorScheme.inverseSurface,
              inLine ? Colors.green.shade400 : Colors.red.shade400,
            ]),
            borderRadius: BorderRadius.circular(defaultPadding * 0.75),
          ),
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                inLine ? "На линии" : "Занят",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
