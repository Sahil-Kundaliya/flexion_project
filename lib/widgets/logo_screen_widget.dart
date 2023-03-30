import 'package:flutter/material.dart';

class LogoScreenWidget extends StatelessWidget {
  const LogoScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueGrey,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 100,
          width: 50,
          child: ListTile(
            title: Text(
              "Title",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.shutterstock.com/image-illustration/purbalingga-indonesia-january-22th-2021sasuke-600w-1900133647.jpg'),
              maxRadius: 28,
            ),
            subtitle: Text(
              "For the best lion documentaries you can stream now, look no further, they are available on discovery+. The lives of these stunning beasts are laid bare in some of the most incredible stories you’ll ever see from the natural world",
              style: TextStyle(fontSize: 15),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          )),
    );
  }
}
