import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutternews/device_enum.dart';

//  this is the method i wrote to check on which device i am running

getDevice() {
  if (kIsWeb) { // this is web
    // running on the web!
    return Devices.web;
  } else {
    if (Platform.isAndroid || Platform.isIOS) { // mobile
      return Devices.mobile;
    } else if (Platform.isMacOS || Platform.isWindows) { // desktop
      return Devices.desktop;
    }
  }
}
