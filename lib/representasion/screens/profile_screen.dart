import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_config.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representasion/components/button_compoents.dart';
import 'package:travel_app/representasion/widgets/app_bar_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController(text: 'Nguyen Van A');
  final TextEditingController _emailController = TextEditingController(text: 'nguyenvana@example.com');
  final TextEditingController _phoneController = TextEditingController(text: '+84 123 456 789');
  final TextEditingController _addressController = TextEditingController(text: 'Hanoi, Vietnam');

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        backgroundColor: ColorPalete.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: kMediumPadding),
              GestureDetector(
                onTap: () {
                  // Implement image picker here
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/anhtn.png'), // Replace with your image path
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        FontAwesomeIcons.camera,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: kMediumPadding),
              _buildEditableField('Full Name', _nameController, TextInputType.text),
              SizedBox(height: kMediumPadding),
              _buildEditableField('Email', _emailController, TextInputType.emailAddress),
              SizedBox(height: kMediumPadding),
              _buildEditableField('Phone Number', _phoneController, TextInputType.phone),
              SizedBox(height: kMediumPadding),
              _buildEditableField('Address', _addressController, TextInputType.text),
              SizedBox(height: kMediumPadding*2),
              ButtonComponent(size: size, content: 'Save Changes', onTap: (){},),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller, TextInputType keyboardType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
              hintText: 'Search your destination',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding)),
        ),
      ],
    );
  }
}