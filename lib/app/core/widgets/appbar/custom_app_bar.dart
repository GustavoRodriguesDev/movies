import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final personImage =
      "https://img.freepik.com/vetores-premium/perfil-de-avatar-de-homem-no-icone-redondo_24640-14044.jpg";
  bool isSearch = false;
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
            Container(
              height: width * 0.12,
              width: width * 0.12,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.05)),
              child: IconButton(
                splashRadius: width * 0.06,
                onPressed: () {
                  isSearch = !isSearch;
                  setState(() {});
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
