import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      this.leading,
      this.title,
      this.backgroundColor,
      this.action,
      this.centerTitle})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final Widget? leading;
  final Widget? title;
  final Widget? action;
  final bool? centerTitle;
  final Size preferredSize;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leading,
      title: title,
      centerTitle: centerTitle,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 8),
            child: action ?? const SizedBox())
      ],
      elevation: 0,
      scrolledUnderElevation: 2,
      iconTheme: Theme.of(context).iconTheme,
      backgroundColor: backgroundColor ?? Theme.of(context).canvasColor,
      surfaceTintColor: Colors.transparent,
    );
  }
}
