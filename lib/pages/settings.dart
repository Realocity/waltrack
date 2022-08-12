import 'package:flutter/cupertino.dart';
import 'package:waltrack/controllers/db_helper.dart';
import 'package:waltrack/pages/notificationservice.dart';
import 'package:waltrack/pages/widgets/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  //

  DbHelper dbHelper = DbHelper();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _notificationService = NotificationService();
  


  //
  @override
  Widget build(BuildContext context) {
    var pages;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          "Settings",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
          ListTile(
            onTap: () async {
              bool answer = await showConfirmDialog(context, "Warning",
                  "This is irreversible. Your entire data will be Lost");
              if (answer) {
                await dbHelper.cleanData();
                Navigator.of(context).pop();
              }
            },
            tileColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            title: const Text(
              "Clean Data",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            subtitle: const Text(
              "This is irreversible",
            ),
            trailing: const Icon(
              Icons.delete_forever,
              size: 32.0,
              color: Colors.black87,
            ),
          ),
          //
          const SizedBox(
            height: 20.0,
          ),

          // Change name
          ListTile(
            onTap: () async {
              String nameEditing = "";
              String? name = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.grey[300],
                  title: const Text(
                    "Enter new name",
                  ),
                  content: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Your Name",
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                      maxLength: 12,
                      onChanged: (val) {
                        nameEditing = val;
                      },
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(nameEditing);
                      },
                      child: const Text(
                        "OK",
                      ),
                    ),
                  ],
                ),
              );
              //
              if (name != null && name.isNotEmpty) {
                DbHelper dbHelper = DbHelper();
                await dbHelper.addName(name);
              }
            },
            tileColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            title: const Text(
              "Change Name",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            subtitle: const Text(
              "Welcome {newname}",
            ),
            trailing: const Icon(
              Icons.change_circle,
              size: 32.0,
              color: Colors.black87,
            ),
          ),
          //
          const SizedBox(
            height: 20.0,
          ),

          // Authentication
          FutureBuilder<bool>(
            future: dbHelper.getLocalAuth(),
            builder: (context, snapshot) {
              // print(snapshot.data);
              if (snapshot.hasData) {
                return SwitchListTile(
                  onChanged: (val) {
                    DbHelper dbHelper = DbHelper();
                    dbHelper.setLocalAuth(val);
                    setState(() {});
                  },
                  value: snapshot.data == null ? false : snapshot.data!,
                  tileColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 20.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  title: const Text(
                    "Local Bio Auth",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  subtitle: const Text(
                    "Secure This app, Use Fingerprint to unlock the app.",
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          // ignore: prefer_const_constructors

          // Terms and Conditions
          ListTile(
            onTap: () => {
              launch(
                  'https://realocity.blogspot.com/p/waltrack-terms-and-condicitions.html')
            },
            tileColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            title: const Text(
              'Terms & Conditions',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            subtitle: const Text(
              "For the purposes of these Terms and Conditions:",
            ),
            trailing: const Icon(
              Icons.file_copy,
              size: 32.0,
              color: Colors.black87,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),

          // Privacy Policy
          ListTile(
            onTap: () => {
              launch(
                  'https://realocity.blogspot.com/p/waltrack-privacy-policy.html')
            },
            tileColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            subtitle: const Text(
              "I value your trust in providing us your Personal Information,",
            ),
            trailing: const Icon(
              Icons.policy,
              size: 32.0,
              color: Colors.black87,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),

          // About
          ListTile(
            onTap: () {
              Navigator.push(context,CupertinoPageRoute(builder: (redContext) => ProfileApp()));
            },
            tileColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            title: const Text(
              'About',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            subtitle: const Text(
              "The info about application and developer.",
            ),
            trailing: const Icon(
              Icons.info,
              size: 32.0,
              color: Colors.black87,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),


          ListTile(
            onTap: () => pages.instantNofitication(), //{},
            tileColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            title: const Text(
              'Notifications',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            subtitle: const Text(
              "Secure This app, Use Fingerprint to unlock the app.",
            ),
            trailing: const Icon(
              Icons.exit_to_app,
              size: 32.0,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
