import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final String userName;
  final String userPassword;

  const EditProfile(
      {super.key, required this.userName, required this.userPassword});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Container());
  }
}
