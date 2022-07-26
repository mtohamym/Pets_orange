import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 300,
      width: screenSize.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromRGBO(103, 71, 57, 1),
          Color.fromRGBO(24, 7, 1, 1),
        ],
      )),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                      right: 10,
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset("doghand.png")),
                    ),
                    Text(
                      "For any questions",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 227, 197, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/337/600',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Tohamydev@gmail.com',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 227, 197, 1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/337/600',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '(+2)0123456789',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 227, 197, 1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                      right: 10,
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset("doghand.png")),
                    ),
                    Text(
                      "For any questions",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 227, 197, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/337/600',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Tohamydev@gmail.com',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 227, 197, 1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/337/600',
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '(+2)0123456789',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 227, 197, 1),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [Text("Image")],
            ),
          ],
        ),
      ),
    );
  }
}
