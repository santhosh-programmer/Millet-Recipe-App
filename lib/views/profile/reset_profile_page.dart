import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:millet_recipe_app/views/profile/profilePage.dart';
import '../auth/login_page.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final double profileHeight = 80;
  final _nameController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  var currentPassword = '';
  var newPassword = '';
  var newName = '';

  @override
  void initState() {
    super.initState();
    _nameController.text = userName;
  }

  void saveChanges() {
    newName = _nameController.text;
    currentPassword = _currentPasswordController.text;
    newPassword = _newPasswordController.text;
    if (password == currentPassword) {
      setState(() {
        userName = newName;
        password = newPassword;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Your Current Password should be correct to make any changes",
            style: TextStyle(color: appColor),
          ),
        ),
        backgroundColor: Colors.black54,
      ));
    }
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20.0),
              avatarImage(),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _nameController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Colors.black), //<-- SEE HERE
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Colors.black), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 4, color: Colors.black), //<-- SEE HERE
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  hintText: 'Enter your Password',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(
                    Icons.person_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _currentPasswordController,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.black), //<-- SEE HERE
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.black), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 4, color: Colors.black), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black),
                      ),
                      hintText: 'Enter your Current Password',
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _newPasswordController,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: false,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.black), //<-- SEE HERE
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Colors.black), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 4, color: Colors.black), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black),
                      ),
                      hintText: 'Enter your New Password',
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
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
                    onPressed: saveChanges,
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget avatarImage() => CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        radius: profileHeight,
        backgroundImage: const CachedNetworkImageProvider(
            'https://as1.ftcdn.net/v2/jpg/03/28/19/46/1000_F_328194664_RKSHvMLgHphnD1nwQYb4QKcNeEApJmqa.jpg'),
      );
}
