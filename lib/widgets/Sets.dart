import 'package:flutter/material.dart';

class Sets extends StatefulWidget {
  @override
  State<Sets> createState() => _Sets();
}

class _Sets extends State<Sets> {
  int setCnt = 5;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$setCnt",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                ),
              ),
              const Text(
                "SETS",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(19),
            ),
          ),
        )
      ],
    );
  }
}
