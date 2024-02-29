import 'package:flutter/material.dart';

import '../../../../core/colors.dart';

class SearchWidget extends StatelessWidget implements PreferredSizeWidget {
  final String query;
  final void Function(String value) onChanged;

  const SearchWidget({
    super.key,
    required this.query,
    required this.onChanged,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextField(
        controller: TextEditingController(
          text: query,
        ),
        decoration: const InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: AppColors.white,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.white,
          ),
        ),
        style: const TextStyle(
          color: AppColors.white,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
