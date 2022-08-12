import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    launchMailto() async {
  final mailtoLink = Mailto(
    to: ['dev.shubhamsapkal@gmail.com'],
    cc: ['ssapkal101@gmail.com'],
    subject: 'mailto example subject',
    body: 'mailto example body',
  );
  // Convert the Mailto instance into a string.
  // Use either Dart's string interpolation
  // or the toString() method.
  final mailtoString = mailtoLink.toString();
  print(mailtoString);
}
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.redAccent, Colors.pinkAccent])),
              child: SizedBox(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/logoiconold.png'),
                        radius: 60.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "WalTrack",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Version 1.0.0",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Build Date: 2022-08-10",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Build Time: 10:00:00",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "About :",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontStyle: FontStyle.normal,
                      fontSize: 28.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'This app will give you all the details about your daily income and expenses.\n\n'
                  'This application is developed as a part of the Semester IV project for the course "Masters in Computer Application"\n\n'
                  'This application is developed by Shubham Sapkal.\n',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80.0,
          ),
          // SizedBox(
          //   width: 300.00,
            
          //   child: RaisedButton(
          //       onPressed: () {
          //         launch('$launchMailto');
          //       },
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(80.0)),
          //       elevation: 0.0,
          //       padding: const EdgeInsets.all(0.0),
          //       child: Ink(
          //         decoration: BoxDecoration(
          //           gradient: const LinearGradient(
          //               begin: Alignment.centerRight,
          //               end: Alignment.centerLeft,
          //               colors: [Colors.redAccent, Colors.pinkAccent]),
          //           borderRadius: BorderRadius.circular(30.0),
          //         ),
          //         child: Container(
          //           constraints:
          //               const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          //           alignment: Alignment.center,
          //           child: const Text(
          //             "Contact me",
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 26.0,
          //                 fontWeight: FontWeight.w300),
          //           ),
          //         ),
          //       )),
          // ),
          const SizedBox(
            height: 20.0,
          ),
          FloatingActionButton.extended(
            splashColor: const Color.fromARGB(255, 255, 93, 64),
            elevation: 12,
            hoverElevation: 50,
            extendedIconLabelSpacing: 20.0,
            label: const Text('copyright © 2022 WalTrack'), // <-- Text
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            icon: const Icon(
              // <-- Icon
              Icons.open_in_new,
              size: 24.0,
            ),
            onPressed: () {
              // ignore: deprecated_member_use
              launch(
                  'https://github.com/Realocity/waltrack/blob/main/LICENSE.md');
            },
          ),
        ],
      ),
    );
  }
}
