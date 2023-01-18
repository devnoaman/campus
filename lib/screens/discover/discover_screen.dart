import 'dart:async';
import 'dart:ui';
import 'package:campus/models/apps_model/app.dart';
import 'package:campus/models/apps_model/apps_model.dart';
import 'package:campus/models/discover_model/discover.dart' as dis;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus/models/discover_model/discover_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

import 'package:campus/data/constants.dart';
import 'package:campus/helpers/helpers.dart';
import 'package:campus/models/apps_model.dart';
import 'package:campus/models/discover_model.dart';
import 'package:campus/screens/discover/discover_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Discover extends HookConsumerWidget {
  Discover({Key? key}) : super(key: key);
  final _controller = StreamController<SwipeRefreshState>.broadcast();
  // final _controller = useStreamController<SwipeRefreshState>().;

  Stream<SwipeRefreshState> get _stream => _controller.stream;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var dis = ref.watch(discoverProvider);
    var apps = ref.watch(appsProvider);

    Future<void> _refresh() async {
      await Future<void>.delayed(const Duration(seconds: 3));
      // when all needed is done change state
      ref.refresh(discoverProvider);
      ref.refresh(appsProvider);
      _controller.sink.add(SwipeRefreshState.hidden);
    }

    return Container(
      width: getSize(context).width,
      height: getSize(context).height,
      child: SwipeRefresh.cupertino(
        stateStream: _stream,
        onRefresh: _refresh,
        children: [
          // Text(dis.length.toString()),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Discover',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: 32,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Find free, high-quality educational materials, including activities and apps, that you can rely on. ',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            width: getSize(context).width,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/apps.jpeg'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DiscoverSeperator(
              title: 'Blogs',
              onTap: () {},
            ),
          ),
          // SizedBox(
          //   width: getSize(context).width,
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: 5,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemBuilder: (BuildContext context, int index) {
          //       return const Padding(
          //         padding: EdgeInsets.all(16.0),
          //         child: DiscoverCard(
          //           title: 'Discover the Google Workspace apps',
          //         ),
          //       );
          //     },
          //   ),
          // ),
          dis.when(data: (data) {
            return SizedBox(
              width: getSize(context).width,
              //todo
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: (data!.length >= 5) ? 5 : data.length,
                itemBuilder: (context, index) {
                  return DiscoverCard(
                    model: data[index],
                  );
                },
              ),
            );
          }, error: (error, st) {
            return Center(
              child: Text(error.toString()),
            );
          }, loading: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DiscoverSeperator(
              title: 'Apps',
              onTap: () {},
            ),
          ),

//todo

          apps.when(data: (data) {
            return Container(
              width: getSize(context).width,
              height: 200,
              child: ListView.builder(
                itemCount: (data!.length >= 5) ? 5 : data.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DiscoverAppsCard(
                      model: data[index],
                    ),
                  );
                },
              ),
            );
          }, error: (error, st) {
            return Center(
              child: Text(error.toString()),
            );
          }, loading: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
        ],
      ),
    );
  }
}

class DiscoverSeperator extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const DiscoverSeperator({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        (onTap != null)
            ? const Tooltip(
                message: 'more', child: Icon(Icons.more_horiz_outlined))
            : const SizedBox()
      ],
    );
  }
}

class DiscoverCard extends StatelessWidget {
  final String? title;
  final dis.Discover model;
  const DiscoverCard({
    Key? key,
    this.title,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final format = new DateFormat('yyyy-MM-ddTHH:mm:ssZ', 'en-US');
    return Container(
      width: getSize(context).width,
      // height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title.toString(),
              style: const TextStyle(fontSize: 18),
            ),
            const Divider(),
            Text(DateTime.parse(model.createdAt.toString()).toIso8601String()),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  model.sender.toString(),
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: getSize(context).width,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          '$workingUrl' + model.cover.toString(),
                        ),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    color: const Color(0xFF77C9CC),
                    border: Border.all(
                      // color: Theme.of(context).primaryColor,
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlogsButton(
                      title: 'read more',
                      onTap: () {
                        print('clicked');
                        // Navigator.of(context).pushNamed('/web');
                        Navigator.of(context)
                            .pushNamed('/discoverContent', arguments: model);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        color: const Color(0xFFFFFFFF),
        border: Border.all(
          // color: Theme.of(context).primaryColor,
          color: Colors.transparent,
          width: 1,
        ),
      ),
    );
  }
}

class BlogsButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const BlogsButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: title,
      child: TextButton(
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            width: getSize(context).width,
            height: 20,
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Theme.of(context).canvasColor),
              ),
            ),
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(6),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: const BorderSide(color: Colors.transparent))),
          backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}

class DiscoverAppsCard extends StatelessWidget {
  final App model;
  const DiscoverAppsCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var uri = Uri.parse(model.link.toString());
        if (!await launchUrl(uri)) print('Could not launch $uri');

        // return true;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      workingUrl + '/' + model.img.toString())),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
              color: const Color(0xFF77C9CC),
              border: Border.all(
                // color: Theme.of(context).primaryColor,
                color: Colors.transparent,
                width: 1,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            model.title.toString(),
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
