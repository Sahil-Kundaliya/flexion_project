import 'package:flutter/material.dart';

class LogoScreenWidget extends StatelessWidget {
  LogoScreenWidget(
      {Key? key,
      this.title,
      this.url,
      this.imageUrl,
      this.background,
      this.malId})
      : super(key: key);
  String? title;
  int? malId;
  String? background;
  String? imageUrl;
  String? url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/logo_description_screen", arguments: {
          'imageUrl': imageUrl,
          'title': title,
          'background': background,
          'url': url
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFBECFFF),
                style: BorderStyle.solid,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 100,
            width: 50,
            child: ListTile(
              title: Text(
                title ?? '',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl ?? ''),
                maxRadius: 28,
              ),
              subtitle: Text(
                background ?? '',
                style: TextStyle(fontSize: 15),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            )),
      ),
    );
  }
}
