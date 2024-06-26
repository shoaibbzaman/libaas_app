import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libaas_app/common_widget/container_global.dart';
import 'package:libaas_app/common_widget/spaces.dart';
import 'package:libaas_app/component/appbar_component.dart';
import 'package:libaas_app/component/custom_dialog.dart';
import 'package:libaas_app/views/auth/signin_screen/signin_screen.dart';
import 'package:libaas_app/views/auth/signup_screen/term_condition.dart';
import 'package:libaas_app/views/profile/profile_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 10.0),
              child: AppBarComponent(
                title: 'Setting',
                isBack: false,
              ),
            )),
        body: containerGlobalWidget(Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spaces.large,
                      ListTile(
                        onTap: () {
                          Get.to(ProfileScreen());
                        },
                        titleAlignment: ListTileTitleAlignment.center,
                        title: const Text(
                          'Profile',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      Spaces.extrasmall,
                      const Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      Spaces.extrasmall,
                      ListTile(
                        onTap: () {
                          Get.to(const TermConditionScreen());
                        },
                        titleAlignment: ListTileTitleAlignment.center,
                        title: const Text(
                          'Terms and Condition',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      Spaces.extrasmall,
                      const Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      Spaces.extrasmall,
                      ListTile(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          Get.offAll(SignInScreen());
                        },
                        titleAlignment: ListTileTitleAlignment.center,
                        title: const Text(
                          'Logout',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Spaces.extrasmall,
                      const Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      Spaces.extrasmall,
                      ListTile(
                        titleAlignment: ListTileTitleAlignment.center,
                        title: const Text(
                          'Push Notification Setting',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        trailing: Switch(
                          // This bool value toggles the switch.
                          value: light,
                          activeTrackColor: Colors.white,
                          activeColor: Colors.green,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              light = value;
                            });
                          },
                        ),
                      ),
                      Spaces.extrasmall,
                      const Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                      Spaces.extrasmall,
                      ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const DeleteAccountDialog();
                            },
                          );
                        },
                        titleAlignment: ListTileTitleAlignment.center,
                        title: const Text(
                          'Delect Account',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ]),
              ),
            ))),
      ),
    );
  }
}
