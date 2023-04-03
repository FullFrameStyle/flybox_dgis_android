import 'package:flutter/material.dart';
import 'package:flybox/presentation/courier/pages/qr_code_scaner/qr_code_scanner_widget.dart';
import 'package:flybox/presentation/courier/pages/shift/shift_payments_info_widget.dart';
import 'package:flybox/presentation/courier/pages/support/support_service_widget.dart';
import 'package:go_router/go_router.dart';

import '../data/constants/pages.dart';
import '../presentation/courier/courier_main_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

CustomTransitionPage slideTransitionPage<T>(
    {required BuildContext context,
    required GoRouterState state,
    required Widget child}) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 250),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    opaque: true,
    child: child,
    key: state.pageKey,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
      opacity: animation.drive(CurveTween(curve: Curves.easeOut)),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    ),
  );
}

GoRouter goRouter() {
  return GoRouter(
    initialLocation: AppPages.courier.routePath,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        name: AppPages.courier.routeName,
        path: AppPages.courier.routePath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CourierMainPageWidget(),
        ),
        routes: [
          GoRoute(
            name: AppPages.supportService.routeName,
            path: AppPages.supportService.routePath,
            pageBuilder: (context, state) => slideTransitionPage(
              context: context,
              state: state,
              child: const SupportServiceWidget(),
            ),
          ),
          GoRoute(
            name: AppPages.shiftPaymentsInfomation.routeName,
            path: AppPages.shiftPaymentsInfomation.routePath,
            pageBuilder: (context, state) => slideTransitionPage(
              context: context,
              state: state,
              child: const ShiftPaymentsInfomationWidget(),
            ),
          ),
          GoRoute(
            name: AppPages.qrCodeScanner.routeName,
            path: AppPages.qrCodeScanner.routePath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: QrCodeScannerWidget(),
            ),
          ),
        ],
      ),
    ],
  );
}
