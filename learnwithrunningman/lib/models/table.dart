import 'package:flutter/material.dart';

class LatexStyleTable extends StatelessWidget {
  final String tableData;

  const LatexStyleTable({
    super.key,
    required this.tableData,
  });

  @override
  Widget build(BuildContext context) {
    final rows = tableData.split('//');

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Table(
        border: TableBorder.all(
          color: Colors.black,
          width: 1,
          style: BorderStyle.solid,
          borderRadius: BorderRadius.circular(8),
        ),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(2),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: rows.map((row) {
        // Split row into cells
        final cells = row.trim().split('&');
        
        return TableRow(
          children: cells.map((cell) => 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cell.trim() == 'space' ? '' : cell.trim(),
                textAlign: TextAlign.center,
              ),
            )
          ).toList(),
        );
        }).toList(),
      ),
    );
  }
}
