import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/setsState.dart';

class Sets extends StatefulWidget {
  final String title;
  final Function() handlerIncreaseSets;
  final Function() handlerDecreaseSets;

  const Sets({
    Key? key,
    required this.title,
    required this.handlerIncreaseSets,
    required this.handlerDecreaseSets,
  }) : super(key: key);

  @override
  State<Sets> createState() => _SetsState();
}

class _SetsState extends State<Sets> {
  @override
  Widget build(BuildContext context) {
    final sets = Provider.of<SetsState>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_upward),
          onPressed: widget.handlerIncreaseSets,
        ),
        const SizedBox(width: 16.0),
        Text(
          'Sets: ${widget.title}',
          style: TextStyle(fontSize: 24.0),
        ),
        const SizedBox(width: 16.0),
        IconButton(
          icon: Icon(Icons.arrow_downward),
          onPressed: widget.handlerDecreaseSets,
        ),
      ],
    );
  }
}
