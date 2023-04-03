import 'package:flutter/material.dart';
import 'package:flybox/data/constants/pages.dart';
import 'package:flybox/data/constants/values.dart';
import 'package:go_router/go_router.dart';

class CourierShiftModalWidget extends StatelessWidget {
  const CourierShiftModalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inverseSurface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  defaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Текушая смена",
                      style: TextStyle(
                        fontSize: h2,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timelapse_rounded,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            const SizedBox(
                              width: defaultPadding / 2,
                            ),
                            Text(
                              "7ч 34м",
                              style: TextStyle(
                                fontSize: h2,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.delivery_dining_rounded,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            const SizedBox(
                              width: defaultPadding / 2,
                            ),
                            Text(
                              "23",
                              style: TextStyle(
                                fontSize: h2,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.payment,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            const SizedBox(
                              width: defaultPadding / 2,
                            ),
                            Text(
                              "18 900 тг",
                              style: TextStyle(
                                fontSize: h2,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                child: Material(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Принятые оплаты",
                              style: TextStyle(
                                fontSize: h1,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Во время выполнения заказов",
                              style: TextStyle(
                                fontSize: h3,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      ShiftPaymentTileWidget(
                        name: "Наличные",
                        value: "24 040 тг",
                        onTap: () => context.pushNamed(
                          AppPages.shiftPaymentsInfomation.routeName,
                        ),
                      ),
                      const Divider(
                        height: 0,
                      ),
                      ShiftPaymentTileWidget(
                        name: "Безналичные",
                        value: "47 000 тг",
                        onTap: () => context.pushNamed(
                          AppPages.shiftPaymentsInfomation.routeName,
                        ),
                      ),
                      const Divider(
                        height: 0,
                      ),
                      InkWell(
                        onTap: () => context.pushNamed(
                          AppPages.supportService.routeName,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                          ),
                          height: 74,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Служба поддержки",
                                style: TextStyle(
                                  fontSize: h2,
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => context.pushNamed(
                          AppPages.qrCodeScanner.routeName,
                        ),
                        child: Ink(
                          color: Colors.green.shade400,
                          padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                          ),
                          height: kBottomNavigationBarHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Завершить смену",
                                style: TextStyle(
                                  fontSize: h2,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.qr_code_scanner_rounded,
                                color: Colors.white,
                                size: 32,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ShiftPaymentTileWidget extends StatelessWidget {
  final String name;
  final String value;
  final Function onTap;

  const ShiftPaymentTileWidget({
    super.key,
    required this.name,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding / 2,
        ),
        height: 74,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: h2,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: h2,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
