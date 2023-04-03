import 'package:flutter/material.dart';

import '../../../../data/constants/values.dart';

class ShiftPaymentsInfomationWidget extends StatelessWidget {
  const ShiftPaymentsInfomationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Безналичные оплаты",
              style: TextStyle(
                fontSize: pageTitle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                "47 000 тг",
                style: TextStyle(
                  fontSize: h2,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            _PaymentListTileWidget(),
            _PaymentListTileWidget(),
            _PaymentListTileWidget(),
            _PaymentListTileWidget(),
            _PaymentListTileWidget(),
            _PaymentListTileWidget(),
            _PaymentListTileWidget(),
            _PaymentListTileWidget(),
            _PaymentListTileWidget(
              last: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentListTileWidget extends StatelessWidget {
  final bool last;
  const _PaymentListTileWidget({
    this.last = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Доставка №234, 1/3',
                      style: TextStyle(
                        fontSize: h3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '19:45 - 7000 тг',
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
          if (!last) const Divider(height: 0)
        ],
      ),
    );
  }
}
