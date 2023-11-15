import 'package:flutter/material.dart';

class KeyValueTable extends StatelessWidget {
  const KeyValueTable({
    Key? key,
    required this.keyValuePairs,
  }) : super(key: key);

  final Map<String, String> keyValuePairs;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {0: FixedColumnWidth(150)},
      children: keyValuePairs.entries
          .map<TableRow>(
            (e) => TableRow(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(e.key),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(e.value),
                ),
              ],
            ),
          )
          .toList(growable: false),
    );
  }
}
