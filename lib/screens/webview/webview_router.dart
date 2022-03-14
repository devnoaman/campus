import 'package:campus/router/i_router.dart';
import 'package:campus/screens/webview/webview.dart';
import 'package:fluro/fluro.dart';

// import 'package:flutter_deer/routers/i_router.dart';

class SettingRouter implements IRouterProvider {
  static String settingPage = '/web';

  @override
  void initRouter(FluroRouter router) {
    router.define(settingPage,
        transitionType: TransitionType.fadeIn,
        handler: Handler(handlerFunc: (_, __) => const WebView()));
    // router.define(registerPage,
    //     handler: Handler(handlerFunc: (_, __) => const SignUp()));
    // router.define(smsLoginPage,
    //     handler: Handler(handlerFunc: (_, __) => const SMSLoginPage()));
    // router.define(resetPasswordPage,
    //     handler: Handler(handlerFunc: (_, __) => const ResetPasswordPage()));
    // router.define(updatePasswordPage,
    //     handler: Handler(handlerFunc: (_, __) => const UpdatePasswordPage()));
  }
}
