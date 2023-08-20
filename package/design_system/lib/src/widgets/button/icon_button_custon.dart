import 'package:flutter/material.dart';

class IconButtonCuston extends StatefulWidget {
  final double size;
  final IconData iconData;
  final void Function()? onTap;

  const IconButtonCuston({
    Key? key,
    this.size = 16,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  @override
  State<IconButtonCuston> createState() => _IconButtonCustonState();
}

class _IconButtonCustonState extends State<IconButtonCuston> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          child: Icon(
            widget.iconData,
          ),
        ),
      ),
    );
  }
}
