import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flybox/data/constants/values.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerWithScanWindow extends StatefulWidget {
  const BarcodeScannerWithScanWindow({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BarcodeScannerWithScanWindowState createState() =>
      _BarcodeScannerWithScanWindowState();
}

class _BarcodeScannerWithScanWindowState
    extends State<BarcodeScannerWithScanWindow> {
  late MobileScannerController controller = MobileScannerController();
  Barcode? barcode;
  BarcodeCapture? capture;

  Future<void> onDetect(BarcodeCapture barcode) async {
    capture = barcode;
    setState(() => this.barcode = barcode.barcodes.first);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Успех",
        ),
        content: Text(
          "Qr код просканирован - ${barcode.barcodes.first.rawValue}",
        ),
        actions: [
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text("Ок"),
          )
        ],
      ),
    );
  }

  MobileScannerArguments? arguments;

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 250,
      height: 250,
    );
    return Builder(
      builder: (context) {
        return Stack(
          fit: StackFit.expand,
          children: [
            MobileScanner(
              fit: BoxFit.cover,
              scanWindow: scanWindow,
              controller: controller,
              onScannerStarted: (arguments) {
                setState(() {
                  this.arguments = arguments;
                });
              },
              onDetect: onDetect,
            ),
            _getCustomPaintOverlay(context),
            Column(
              children: const [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Text(
                        "Для того чтобы завершить смену просканируйте Qr-код",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: h2,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Text(
                        "и ожидайте подтверждения оператором",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: h2,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  CustomPaint _getCustomPaintOverlay(BuildContext context) {
    return CustomPaint(
        size: MediaQuery.of(context).size, painter: ViewfinderPainter());
  }
}

class ViewfinderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final canvasRect = Offset.zero & size;
    const rectWidth = 250.0;
    final rect = Rect.fromCircle(
      center: canvasRect.center,
      radius: rectWidth / 2,
    );
    const radius = 12.0;
    const strokeWidth = 4.0;
    const extend = radius + 30.0;
    const arcSize = Size.square(radius * 2);

    canvas.drawPath(
      Path()
        ..fillType = PathFillType.evenOdd
        ..addRRect(
          RRect.fromRectAndRadius(
            rect,
            const Radius.circular(radius),
          ).deflate(strokeWidth / 2),
        )
        ..addRect(canvasRect),
      Paint()..color = Colors.black54,
    );

    canvas.save();
    canvas.translate(rect.left, rect.top);
    final path = Path();
    for (var i = 0; i < 4; i++) {
      final l = i & 1 == 0;
      final t = i & 2 == 0;
      path
        ..moveTo(l ? strokeWidth / 2 : rectWidth - strokeWidth / 2,
            t ? extend : rectWidth - extend)
        ..arcTo(
            Offset(
                    l
                        ? strokeWidth / 2
                        : rectWidth - strokeWidth / 2 - arcSize.width,
                    t
                        ? strokeWidth / 2
                        : rectWidth - arcSize.width - strokeWidth / 2) &
                arcSize,
            l ? pi : pi * 2,
            l == t ? pi / 2 : -pi / 2,
            false)
        ..lineTo(l ? extend : rectWidth - extend,
            t ? strokeWidth / 2 : rectWidth - strokeWidth / 2);
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.red
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(ViewfinderPainter oldDelegate) => false;
}
