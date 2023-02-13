import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'golden_tolerance_comparator.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      final baseDirectory =
          (goldenFileComparator as LocalFileComparator).basedir.toString();

      goldenFileComparator =
          GoldenToleranceComparator('$baseDirectory/goldens');

      await testMain();
    },
    config: GoldenToolkitConfiguration(defaultDevices: const [Device.phone]),
  );
}
