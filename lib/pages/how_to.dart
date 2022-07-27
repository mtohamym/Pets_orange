import 'package:flutter/material.dart';
import 'package:petology_test/wedgits/footer.dart';
import 'package:petology_test/wedgits/navBar.dart';

class HowToPage extends StatelessWidget {
  HowToPage({Key? key}) : super(key: key);

  List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    String title = "How do you feed your dog ?";
    String body =
        "How do you feed your dog ? How do you feed your dog ? How do you feed your dog ? How do you feed your dog ? How do you feed your dog ? How do you feed your dog ? How do you feed your dog ? How do you feed your dog ? How do you feed your dog ? How do you feed your dog ?";

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: screenSize.height,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomNavBar(isTransparent: true),
                    Image.asset(
                      "doghand.png",
                      width: 500,
                      height: 500,
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: screenSize.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Color(0xff492f24),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(body,
                          style:
                              TextStyle(color: Colors.grey[900], fontSize: 20)),
                    )
                  ],
                ),
              ),
            ),
            CustomFooter()
          ],
        ),
      ),
    );
  }
}
