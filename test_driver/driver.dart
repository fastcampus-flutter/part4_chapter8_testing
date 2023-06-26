// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:integration_test/integration_test_driver.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:integration_test/integration_test_driver_extended.dart';

/// as-is
// Future<void> main() => integrationDriver();

/// to-be
Future<void> main() async {
  try {
    await integrationDriver(
      onScreenshot: (name, image, [args]) async {
        final File imageFile = await File('screenshots/$name.png').create(recursive: true);

        print('imageFile.writeAsBytes');
        await imageFile.writeAsBytes(image);

        print('scuccc');

        return true;
      },
    );
  } catch (e, s) {
    debugPrint('$e');
    debugPrint('$s');
  }
}
