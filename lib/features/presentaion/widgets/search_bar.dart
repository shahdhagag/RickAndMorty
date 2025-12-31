import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isSearching;
  final TextEditingController controller;
  final VoidCallback onSearchPressed;
  final VoidCallback onClosePressed;
  final ValueChanged<String> onChanged;
  final String title;

  const SearchAppBar({
    super.key,
    required this.isSearching,
    required this.controller,
    required this.onSearchPressed,
    required this.onClosePressed,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isSearching
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onClosePressed,
            )
          : null,
      title: isSearching
          ? TextField(
              controller: controller,
              autofocus: true,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                suffixIcon: controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.black),
                        onPressed: () {
                          controller.clear();
                          onChanged('');
                        },
                      )
                    : null,
              ),
            )
          : Text(title),
      actions: [
        if (!isSearching)
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearchPressed,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
