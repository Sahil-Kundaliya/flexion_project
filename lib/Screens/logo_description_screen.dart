import 'package:flutter/material.dart';

class LogoDescription extends StatelessWidget {
  const LogoDescription({Key? key}) : super(key: key);
  static const routeName = "/logo_description_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 280,
                width: double.infinity,
                color: Colors.red,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(
                      'https://www.denofgeek.com/wp-content/uploads/2021/04/jujutsu-kaisen-season-2-movie-prequel-details.jpeg'),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Title",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, left: 15, right: 55),
                child: Text(
                  "For the best lion documentaries you can stream now, look no further, they are available on discovery+. The lives of these stunning beasts are laid bare in some of the most incredible stories you’ll ever see from the natural world",
                  style: TextStyle(fontSize: 14),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: CircleAvatar(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              backgroundColor: Colors.white10,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'View More',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
