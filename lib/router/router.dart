import 'package:campus/router/i_router.dart';
import 'package:campus/router/not_found_page.dart';
import 'package:campus/screens/home.dart';
import 'package:campus/screens/webview/webview_router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  static String home = '/home';
  // static String webViewPage = '/webView';

  static final List<IRouterProvider> _listRouter = [];

  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    /// 指定路由跳转错误返回页
    /// Specify route jump error return page
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      debugPrint('init router');
      return const NotFoundPage();
    });

    router.define(home,
        handler: Handler(
            handlerFunc:
                (BuildContext? context, Map<String, List<String>> params) =>
                    const Home()));

    // router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
    //   final String title = params['title']?.first ?? '';
    //   final String url = params['url']?.first ?? '';
    //   return WebViewPage(title: title, url: url);
    // }));

    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
    /// The respective routes are managed by their respective modules,
    ///  and the initialization is added here uniformly
    ///
    ///
    ///
    // _listRouter.add(ShopRouter());

    // _listRouter.add(GoodsRouter());
    // _listRouter.add(OrderRouter());
    // _listRouter.add(StoreRouter());
    // _listRouter.add(AccountRouter());
    _listRouter.add(SettingRouter());
    // _listRouter.add(WebViewRouter());
    // _listRouter.add(StatisticsRouter());

    /// 初始化路由
    void initRouter(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }

    _listRouter.forEach(initRouter);
  }
}
