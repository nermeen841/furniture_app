import 'dart:io';
import 'dart:ui';
import 'package:flutter/services.dart';


class Admob {
  static const _channel = MethodChannel('admob_flutter');

  Admob.initialize({List<String> testDeviceIds}) {
    _channel.invokeMethod('initialize', testDeviceIds);
  }
  
  static Future<bool> requestTrackingAuthorization() {
	  if (!Platform.isIOS) {
		  return Future<bool>.value(true);
	  }
	  return _channel.invokeMethod('request_tracking_authorization');
  }

  static Future<Size> bannerSize( admobBannerSize, { AdmobBannerSize}) async {
    final rawResult = await _channel.invokeMethod('banner_size', admobBannerSize.toMap);
    final resultMap = Map<String, num>.from(rawResult);
    return Size(resultMap['width'].ceilToDouble(), resultMap['height'].ceilToDouble());
  }
}
