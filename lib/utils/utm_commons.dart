import 'dart:async';
import 'dart:developer';

import 'package:uni_links/uni_links.dart';

import '../router/go_route.dart';
import 'constants.dart';

class UtmCommons {
  static String id = "";
  static String utmSource = "";
  static String utmCampaign = "";
  static String utmMedium = "";
  static StreamSubscription? sub;

  static Future<void> initUniLinks() async {
    try {
      final initialLink = await getInitialLink();
      if (initialLink != null) {
        extractUTMParameters(initialLink);
      }

      sub = linkStream.listen((String? link) {
        if (link != null) {
          extractUTMParameters(link);
        }
      });
    } catch (e) {
      log('Failed to get UTM parameters: $e');
    }
  }

  static extractUTMParameters(String link) {
    Uri uri = Uri.parse(link);
    id = uri.queryParameters['id']!;
    utmSource = uri.queryParameters['utm_source']!;
    utmCampaign = uri.queryParameters['utm_campaign']!;
    utmMedium = uri.queryParameters['utm_medium']!;
    log('UTM parameters: utmSource: $utmSource, utmCampaign: $utmCampaign, utmMedium: $utmMedium');
    router.go('$loginScreenWithData/$id/$utmCampaign/$utmSource/$utmMedium');
  }
}
