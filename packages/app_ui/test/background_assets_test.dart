import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:app_ui/resources/resources.dart';

void main() {
  test('background_assets assets test', () {
    expect(File(BackgroundAssets.bkgBg).existsSync(), isTrue);
  });
}
