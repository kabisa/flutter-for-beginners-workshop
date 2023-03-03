import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

extension WidgetTesterExtension on WidgetTester {
  Future<void> pumpMaterialApp(
    Widget widget, [
    MockNavigator? navigator,
    Duration? duration,
    EnginePhase phase = EnginePhase.sendSemanticsUpdate,
  ]) async {
    final app = MaterialApp(
      home: MockNavigatorProvider(
        navigator: navigator ?? MockNavigator(),
        child: Scaffold(
          body: widget,
        ),
      ),
    );

    return await mockNetworkImages(
      () async => await pumpWidget(app, duration, phase),
    );
  }
}
