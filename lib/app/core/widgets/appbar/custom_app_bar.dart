import 'package:flutter/material.dart';

import '../button/icon_button_custon.dart';

class CustomAppBar extends StatefulWidget {
  final void Function()? onPressed;
  const CustomAppBar({Key? key, this.onPressed}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final personImage =
      "https://img.freepik.com/vetores-premium/perfil-de-avatar-de-homem-no-icone-redondo_24640-14044.jpg";

  final duration = const Duration(milliseconds: 600);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: 100,
      backgroundColor: const Color(0xFF1B2230),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(personImage),
              ),
            ),
          ),
          const Text(
            'Gustavo Rodrigues',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          IconButtonCuston(
            size: width * 0.12,
            iconData: Icons.search,
            onTap: widget.onPressed,
          ),
        ],
      ),
    );
  }
}
