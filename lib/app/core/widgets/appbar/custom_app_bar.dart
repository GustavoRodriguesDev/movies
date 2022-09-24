import 'package:flutter/material.dart';

import '../button/icon_button_custon.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final void Function()? onPressed;
  const CustomAppBar({Key? key, this.onPressed}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final personImage =
      "https://img.freepik.com/vetores-premium/perfil-de-avatar-de-homem-no-icone-redondo_24640-14044.jpg";

  final duration = const Duration(milliseconds: 600);
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        width: width,
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: width * 0.15,
              width: width * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(personImage),
                ),
              ),
            ),
            const Text('Gustavo Rodrigues', style: TextStyle(color: Colors.white, fontSize: 20)),
            IconButtonCuston(
              size: width * 0.12,
              iconData: Icons.search,
              onTap: widget.onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
