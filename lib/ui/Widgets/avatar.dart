import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {

  // TODO remove baseURL from here, provide full url to this class
  static String baseUrl;
  final double size;
  final String url;
  final String status;

  const Avatar(
      {Key key, @required this.size, @required this.url, @required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget icon = Container();

    if (status == "APPROVED") {
      icon = const Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 15,
      );
    } else if (status == "NEEDS_WORK") {
      icon = const Icon(
        Icons.error,
        color: Colors.orange,
        size: 15,
      );
    }

    if (icon != null) {
      return Container(
        width: size,
        height: size,
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                  width: size - 5,
                  height: size - 5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: url != null
                          ? DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  url.contains("http") ? url : "$baseUrl$url"))
                          : null)),
            ),
            Positioned(
              right: 1,
              top: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: icon,
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: url != null
                  ? NetworkImage(url.contains("http")
                      ? url
                      : "https://bitbucket.digital-farming.com/$url")
                  : null)),
    );
  }
}
