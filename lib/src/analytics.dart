import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

///
class Analytics {
  const Analytics._();

  static const MethodChannel _channel = MethodChannel('v7lin.github.io/analytics_kit');

  ///
  static Future<void> init({
    @required String appKey,
    @required String channelId,
    bool debugEnabled = false,
  }) {
    assert(appKey?.isNotEmpty ?? false);
    assert(channelId?.isNotEmpty ?? false);
    return _channel.invokeMethod<void>('init', <String, dynamic>{
      'app_key': appKey,
      'channel_id': channelId,
      'debug_enabled': debugEnabled,
    });
  }

  ///
  static Future<void> setOaid({@required String oaid}) {
    assert(Platform.isAndroid);
    assert(oaid?.isNotEmpty ?? false);
    return _channel.invokeMethod('setOaid', <String, dynamic>{
      'oaid': oaid,
    });
  }

  ///
  static Future<void> setAdid({@required String adid}) {
    assert(Platform.isIOS);
    assert(adid?.isNotEmpty ?? false);
    return _channel.invokeMethod('setAdid', <String, dynamic>{
      'adid': adid,
    });
  }

  ///
  static Future<void> setAuthorizedState({@required bool enabled}) {
    assert(Platform.isAndroid);
    assert(enabled != null);
    return _channel.invokeMethod('setAuthorizedState', <String, dynamic>{
      'enabled': enabled,
    });
  }

  ///
  static Future<String> getTestDeviceId() {
    return _channel.invokeMethod<String>('getTestDeviceId');
  }

  ///
  static Future<void> startPageTracking({@required String pageName}) {
    assert(pageName?.isNotEmpty ?? false);
    return _channel.invokeMethod<void>('startPageTracking', <String, dynamic>{
      'page_name': pageName,
    });
  }

  ///
  static Future<void> stopPageTracking({@required String pageName}) {
    assert(pageName?.isNotEmpty ?? false);
    return _channel.invokeMethod<void>('stopPageTracking', <String, dynamic>{
      'page_name': pageName,
    });
  }

  ///
  static Future<void> trackEvent({
    @required String eventId,
    Map<String, String > eventParams,
  }) {
    assert(eventId?.isNotEmpty ?? false);
    return _channel.invokeMethod<void>('trackEvent', <String, dynamic>{
      'event_id': eventId,
      if (eventParams?.isNotEmpty ?? false) 'event_params': eventParams,
    });
  }
}
