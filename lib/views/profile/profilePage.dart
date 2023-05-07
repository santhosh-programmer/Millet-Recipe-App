import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:millet_recipe_app/views/profile/reset_profile_page.dart';

class ProfilePage extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userPassword;

  const ProfilePage(
      {super.key,
      required this.userName,
      required this.userEmail,
      required this.userPassword});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 200;
  final double profileHeight = 140;
  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    final title = coverHeight / 4.5;

    return Scaffold(
        body: ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: profileHeight / 2),
                child: profileImage()),
            Positioned(
              top: top,
              child: avatarImage(),
            ),
            Positioned(
              left: 0,
              top: title,
              child: profileTitle(),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  widget.userName,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.userEmail,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 18, left: 18),
          child: const Text(
            'About',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(18),
          child: const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat',
            textAlign: TextAlign.justify,
            style: TextStyle(height: 1.5, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black54,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(
                          userName: widget.userName,
                          userPassword: widget.userPassword),
                    ));
              },
              child: const Text(
                'Edit Profile',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget profileImage() => Container(
        color: Colors.grey,
        child: CachedNetworkImage(
          imageUrl:
              "https://media.istockphoto.com/id/1162962131/photo/grains-and-millets-served-on-bowl-in-a-wooden-background.jpg?s=612x612&w=0&k=20&c=bl3xE6yBheomOvNP9C6t5WRwDXmGHDUQOooN9eAF57A=",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget avatarImage() => CircleAvatar(
        backgroundColor: Colors.white,
        radius: profileHeight / 2,
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          radius: profileHeight / 2 - 6,
          backgroundImage: const CachedNetworkImageProvider(
              'https://as1.ftcdn.net/v2/jpg/03/28/19/46/1000_F_328194664_RKSHvMLgHphnD1nwQYb4QKcNeEApJmqa.jpg'),
        ),
      );

  Widget profileTitle() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: const Text(
          'Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
}
