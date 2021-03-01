import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'),
                fit: BoxFit.fitHeight)),
        child: Column(
          children: [
            SizedBox(height: 35),
            ClipRRect(
              borderRadius: BorderRadius.circular(255),
              child: FadeInImage.memoryNetwork(
                  height: 96,
                  width: 96,
                  placeholder: kTransparentImage,
                  image:
                      'https://pbs.twimg.com/profile_images/1120994736523837440/SXM3Ceue_400x400.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                '@orientedObject',
                style: TextStyle(fontFamily: 'Ubuntu'),
              ),
            ),
            LinkButton(
                title: 'Twitter', url: 'https://twitter.com/oriented0bject'),
            Spacer(flex: 1),
            LinkButton(
                title: 'LinkedIn',
                url: 'https://www.linkedin.com/in/steve-hines-6567aa1b8/'),
            Spacer(flex: 1),
            LinkButton(
                title: 'Instagram',
                url: 'https://www.instagram.com/i_am_stevie_hines/'),
            Spacer(flex: 1),
            LinkButton(title: 'Github', url: 'https://github.com/steviehines'),
            Spacer(flex: 1),
            LinkButton(
                title: 'Youtube',
                url:
                    'https://www.youtube.com/playlist?list=PLc28pWsr1QrOkXkGwbw2Fw-EPmK089toN'),
            Spacer(flex: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Made In Flutter',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(width: 7),
                FadeInImage.memoryNetwork(
                    height: 25,
                    width: 25,
                    placeholder: kTransparentImage,
                    image:
                        'https://www.didierboelens.com/images/blog/hummingbird_logo.png')
              ],
            ),
            SizedBox(height: 23)
          ],
        ),
      ),
    );
  }
}

class LinkButton extends StatelessWidget {
  final String title;
  final String url;
  const LinkButton({
    Key key,
    @required this.title,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final buttonWidth = width * 0.95;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment(8, 8),
            colors: [
              const Color(0xff5d4034),
              const Color(0xffd7ccc8),
            ],
            // tileMode: TileMode.repeated
          ),
          // Gradient.linear(0.0, 20.0, 0x94716B, 0xB79891),
        ),
        width: width > 600 ? 600 : buttonWidth,
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20),
          onPressed: () => launch(url),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          // color: Colors.brown,
        ),
      ),
    );
  }
}
