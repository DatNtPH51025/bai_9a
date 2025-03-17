import 'dart:io';

import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/ultis/app-funcion/app_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProfilePage());
  }
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 134,
            color: AppColors.cYanPrimary,
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    AppFunction.checkPermissionPhoto(
                      context,
                      callback: () {
                        pickImage();
                      },
                    );
                  },
                  child: image == null
                      ? Image.asset(
                          width: 40,
                          height: 40,
                          AppImages.img_human,
                        )
                      : Image.file(width: 40, height: 40, image!),
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 22),
                    Text(
                      'Ahmed Raza',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ahmedraza@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 120),
                SvgPicture.asset(
                  AppImages.ic_logout,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 113),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Expanded(
              child: ListView(
                children: [
                  buildSectionTitle('Personal Information'),
                  buildProfileOption(
                      context, 'Shipping Address', Icons.local_shipping),
                  buildProfileOption(context, 'Payment Method', Icons.payment),
                  buildProfileOption(context, 'Order History', Icons.history),
                  buildSectionTitle('Support & Information'),
                  buildProfileOption(
                      context, 'Privacy Policy', Icons.privacy_tip),
                  buildProfileOption(
                      context, 'Terms & Conditions', Icons.article),
                  buildProfileOption(context, 'FAQs', Icons.help),
                  buildSectionTitle('Account Management'),
                  buildProfileOption(context, 'Change Password', Icons.lock),
                  SwitchListTile(
                    value: false,
                    onChanged: (bool newValue) {},
                    title: Text("Dark Theme"),
                    secondary: Icon(Icons.dark_mode),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget buildProfileOption(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
      onTap: () {},
    );
  }
}
