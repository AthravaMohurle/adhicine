import 'package:adhicine/screens/SignInPage.dart';
import 'package:adhicine/utils/AppColors.dart';
import 'package:flutter/material.dart';

import '../utils/navigateWithSlideTransition.dart';
import '../widgets/CustomAppBar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: const CustomAppBar(title: "Profile"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            SizedBox(height: 20),
            _buildSettingsSection(),
            SizedBox(height: 20),
            _buildDeviceSection(),
            SizedBox(height: 20),
            _buildCaretakersSection(),
            SizedBox(height: 20),
            _buildDoctorSection(),
            SizedBox(height: 20),
            _buildFooterSection(),
            SizedBox(height: 20),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/women/44.jpg'),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Take Care!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              'Richa Bose',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Settings', style: AppColors.commonTextStyle.copyWith(
          fontSize: 16,
          color:AppColors.black,)),
        SizedBox(height: 10),
        _buildListTile(Icons.notifications, 'Notification', 'Check your medicine notification'),
        _buildListTile(Icons.volume_up, 'Sound', 'Ring, Silent, Vibrate'),
        _buildListTile(Icons.account_circle, 'Manage Your Account', 'Password, Email ID, Phone Number'),
      ],
    );
  }

  Widget _buildDeviceSection() {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Device",
          style:  AppColors.commonTextStyle.copyWith(
            fontSize: 16,
            color:AppColors.black,

          ),),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildListTile(Icons.bluetooth, 'Connect', 'Bluetooth, Wi-Fi'),
              _buildListTile(Icons.volume_up, 'Sound Option', 'Ring, Silent, Vibrate'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCaretakersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Caretakers: 03',  style:  AppColors.commonTextStyle.copyWith(
      fontSize: 16,
      color:AppColors.black,)),
        SizedBox(height: 10),
        Container(
            padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCaretakerAvatar('Dipa Luna', ''),
              _buildCaretakerAvatar('Roz Sod..', 'https://randomuser.me/api/portraits/women/45.jpg'),
              _buildCaretakerAvatar('Sunny Tu..', 'https://randomuser.me/api/portraits/women/46.jpg'),
              _buildAddCaretakerButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.add_circle_rounded, size: 50, color: AppColors.primaryColor),
          Text('Add Your Doctor', style: TextStyle(fontSize: 18)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Or use', style: TextStyle(color: AppColors.black)),
              Text(' invite link', style: TextStyle(color:AppColors.primaryColor)),
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildFooterSection() {
    return Column(
      spacing: 14,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Privacy Policy',style:  AppColors.commonTextStyle.copyWith(
          fontSize: 16,
          color:AppColors.black,)),

        Text('Terms of Use',style:  AppColors.commonTextStyle.copyWith(
          fontSize: 16,
          color:AppColors.black,)),

        Text('Rate Us',style:  AppColors.commonTextStyle.copyWith(
          fontSize: 16,
          color:AppColors.black,)),
        Text('Share',style:  AppColors.commonTextStyle.copyWith(
          fontSize: 16,
          color:AppColors.black,)),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {

          navigateWithSlideTransitionLeftToRight(context,SignInPage(),durationInMillis: 700);
        }
        ,
        child: Text('Log Out',style: TextStyle(color: AppColors.primaryColor),),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }

  Widget _buildCaretakerAvatar(String name, String imageUrl) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
          child: imageUrl.isEmpty ? Icon(Icons.person) : null,
        ),
        SizedBox(height: 5),
        Text(name, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildAddCaretakerButton() {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.add),
        ),
        SizedBox(height: 5),
        Text('Add', style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
