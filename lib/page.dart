import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(height: 35),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: FadeInImage.memoryNetwork(
                height: 96,
                width: 96,
                placeholder: kTransparentImage,
                image:
                    'https://pbs.twimg.com/profile_images/1303979923812556800/zltWpuBp_400x400.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text('@orientedObject'),
          ),
          LinkButton(title: 'Tweet', url: 'https://twitter.com/oriented0bject'),
          Spacer(flex: 1),
          LinkButton(title: 'Tweet', url: 'https://twitter.com/oriented0bject'),
          Spacer(flex: 1),
          LinkButton(title: 'Tweet', url: 'https://twitter.com/oriented0bject'),
          Spacer(flex: 1),
          LinkButton(title: 'Tweet', url: 'https://twitter.com/oriented0bject'),
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
        width: width > 600 ? 600 : buttonWidth,
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20),
          onPressed: () => launch(url),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.green[600],
        ),
      ),
    );
  }
}
