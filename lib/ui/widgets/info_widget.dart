import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String info;
  final Icon iconTemp;
  const InfoWidget({
    super.key,
    required this.title,
    required this.info,
    required this.iconTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal[100],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                iconTemp,
                Text(title),
              ],
            ),
            Text(info),
          ],
        ),
      ),
    );
  }
}
