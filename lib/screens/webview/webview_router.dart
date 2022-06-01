import 'package:campus/router/i_router.dart';
import 'package:campus/screens/webview/webview.dart';
import 'package:fluro/fluro.dart';

class SettingRouter implements IRouterProvider {
  static String settingPage = '/setting';
  static String settingLanguage = '/setting/language';

  @override
  void initRouter(FluroRouter router) {
    router.define(settingPage,
        transitionType: TransitionType.fadeIn,
        handler: Handler(handlerFunc: (_, __) => const WebView()));
    // router.define(settingLanguage,
    //     handler: Handler(handlerFunc: (_, __) => const LanguageAndLocale()));
  }
}
