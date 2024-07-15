import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/constants.dart';
import 'package:grocery/views/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Constants.primaryColor.withOpacity(.5),
                      width: 5.0)),
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage(
                  'assets/images/pr.jpg',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: size.width * .3,
              child: Row(
                children: [
                  Text(
                    'Md Arafat',
                    style: TextStyle(color: Constants.blackColor, fontSize: 20),
                  ),
                  SizedBox(
                    height: 24.0,
                    child: Image.asset('assets/images/verified.png'),
                  ),
                ],
              ),
            ),
            Text(
              'Arafat@gamil.com',
              style: TextStyle(
                color: Constants.blackColor.withOpacity(.3),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Expanded(
                child: SizedBox(
              height: size.height * .6,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileWidget(icon: Icons.person, title: 'Hy  Profile'),
                  ProfileWidget(icon: Icons.settings, title: 'Setting'),
                  ProfileWidget(
                      icon: Icons.notifications, title: 'Notification'),
                  ProfileWidget(icon: Icons.settings, title: 'Setting'),
                  ProfileWidget(icon: Icons.chat, title: 'FAQs'),
                  ProfileWidget(icon: Icons.share, title: 'Share'),
                  ProfileWidget(icon: Icons.logout, title: 'Log Out'),
                ],
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
