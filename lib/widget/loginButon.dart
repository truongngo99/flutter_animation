import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  final String title;
  final VoidCallback? onPress;
  const ButtonPage({Key? key, required this.title, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 40,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.orange, Color.fromARGB(255, 250, 179, 73)],
        ),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
        ),
        onPressed: onPress,
      ),
    );
  }
}
