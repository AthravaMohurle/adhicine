import 'package:flutter/material.dart';

import '../utils/AppColors.dart'; // Adjust the import based on your project structure

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final VoidCallback? onBack;

  const CustomAppBar({
    Key? key,
    this.title,
    this.showBackButton = true,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      leading: showBackButton
          ? IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: onBack ?? () => Navigator.pop(context),
      )
          : null,
      title: title != null ? Text(title!, style: const TextStyle(color: Colors.black)) : null,
      centerTitle: true,
      elevation: 0, // Optional: Customize as needed
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
