import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:campus/helpers/helpers.dart';

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context).width,
      height: getSize(context).height,
      child: ListView(
        children: [
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
            child: const Text(
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
            color: Colors.black,
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
          Container(
            width: getSize(context).width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: const DiscoverCard(
                    title: 'Discover the Google Workspace apps',
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DiscoverSeperator(
              title: 'Apps',
              onTap: () {},
            ),
          ),
          Container(
            width: getSize(context).width,
            height: 200,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DiscoverAppsCard(),
                );
              },
            ),
          )
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
  final String title;
  const DiscoverCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(context).width,
      // height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
            const Divider(),
            const Text('12:12 pm'),
            const SizedBox(
              height: 18,
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eros ligula, tincidunt eu libero at, ultricies lacinia magna. Maecenas a libero nisl. Nullam luctus ex dolor, ut molestie metus facilisis at.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 12),
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
                        Navigator.of(context).pushNamed('/web');
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
  const DiscoverAppsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100,
          height: 100,
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
        const Text(
          'app name here',
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
