import 'package:flutter/material.dart';
import 'package:flybox/presentation/courier/pages/qr_code_scaner/qr_code_scanner_window.widget.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/constants/values.dart';

class QrCodeScannerWidget extends StatelessWidget {
  const QrCodeScannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: const Text(
          "Завершение смены",
          style: TextStyle(
            fontSize: pageTitle,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
            child: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.close,
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(child: BarcodeScannerWithScanWindow()),
          const Divider(
            height: 0,
          ),
          InkWell(
            onTap: () {
              context.pop();
              context.pop();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              height: kBottomNavigationBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Построить маршрут до офиса",
                    style: TextStyle(
                      fontSize: pageTitle,
                    ),
                  ),
                  Icon(Icons.route_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
