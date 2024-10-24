import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:card_settings/common/extensions/text_extensions.dart';
import 'package:card_settings/common/extensions/theme_extensions.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.leading,
    this.hasIcon = false,
    this.bottom,
  });

  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final bool hasIcon;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    final canPop = context.router.canPop();
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: context.colors.title),
      leading: leading ?? (canPop ? appBarLeading(context) : null),
      centerTitle: centerTitle,
      title: (title ?? '').w(500).s(18).c(context.colors.title),
      backgroundColor: context.colors.onPrimary,
      bottom: bottom,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}

Widget appBarLeading(BuildContext context) {
  return IconButton(
    onPressed: () => context.router.maybePop(),
    iconSize: 24,
    icon: Icon(Icons.chevron_left_outlined, color: context.colors.title),
  );
}
