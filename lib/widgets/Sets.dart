import 'package:flutter/material.dart';

class Sets extends StatefulWidget {
  @override
  State<Sets> createState() => _Sets();
}

class _Sets extends State<Sets> {
  int sets = 5;

  void handlerUpdateSets(int newSets) {
    setState(() {
      sets = newSets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            showModal(context, sets, handlerUpdateSets); // setCnt 값을 전달
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  return Colors.red; // 버튼의 색상 지정
                },
              ),
              fixedSize: MaterialStateProperty.resolveWith<Size?>(
                    (Set<MaterialState> states) {
                  return const Size.square(100); // 버튼의 크기 지정
                },
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(19),
                    ),
                  ))),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$sets", // setCnt 값 사용
                  style: const TextStyle(
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
          ),
        )
      ],
    );
  }
}

void showModal(BuildContext context, int sets, Function(int) handlerUpdateSets) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sets: $sets',
                  style: TextStyle(fontSize: 24.0),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_upward),
                      onPressed: () {
                        setState(() {
                          sets++;
                          handlerUpdateSets(sets);
                        });
                      },
                    ),
                    SizedBox(width: 16.0),
                    IconButton(
                      icon: Icon(Icons.arrow_downward),
                      onPressed: () {
                        setState(() {
                          if (sets > 0) {
                            sets--;
                            handlerUpdateSets(sets);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
