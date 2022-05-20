import 'package:campus/compunents/image_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:campus/models/discover_model.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class DiscoverContent extends HookConsumerWidget {
  final DiscoverModel? model;
  const DiscoverContent({
    this.model,
  }) : super();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as DiscoverModel;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title.toString()),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: HtmlWidget(
          args.description.toString(),

          // all other parameters are optional, a few notable params:

          // specify custom styling for an element
          // see supported inline styling below
          customStylesBuilder: (element) {
            if (element.classes.contains('foo')) {
              return {'color': 'red'};
            }

            return null;
          },

          // render a custom widget
          customWidgetBuilder: (element) {
            if (element.attributes['foo'] == 'bar') {
              // return FooBarWidget();
            }

            return null;
          },

          // these callbacks are called when a complicated element is loading
          // or failed to render allowing the app to render progress indicator
          // and fallback widget
          onErrorBuilder: (context, element, error) =>
              Text('$element error: $error'),
          onLoadingBuilder: (context, element, loadingProgress) =>
              const CircularProgressIndicator(),

          // this callback will be triggered when user taps a link
          onTapUrl: (url) {
            print(url);
            return true;
          },
          onTapImage: (img) {
            print(img.sources.first.url);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ImageView(img: img.sources.first.url)));
          },

          // select the render mode for HTML body
          // by default, a simple `Column` is rendered
          // consider using `ListView` or `SliverList` for better performance
          renderMode: RenderMode.listView,

          // set the default styling for text
          textStyle: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
