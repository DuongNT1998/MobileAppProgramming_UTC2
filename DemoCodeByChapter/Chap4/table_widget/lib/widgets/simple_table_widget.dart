import 'package:flutter/material.dart';
import '../utils/constants.dart';

class SimpleTableWidget extends StatelessWidget {
  const SimpleTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: AppColors.borderColor,
        width: 1,
      ),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
      },
      children: [
        _buildHeader(),
        _buildRow('1', 'Nguyễn Văn A', 'Hà Nội'),
        _buildRow('2', 'Trần Thị B', 'TP.HCM'),
        _buildRow('3', 'Lê Văn C', 'Đà Nẵng'),
      ],
    );
  }

  TableRow _buildHeader() {
    return TableRow(
      decoration: const BoxDecoration(
        color: AppColors.headerColor,
      ),
      children: const [
        _HeaderCell(text: 'ID'),
        _HeaderCell(text: 'Tên'),
        _HeaderCell(text: 'Thành phố'),
      ],
    );
  }

  TableRow _buildRow(String id, String name, String city) {
    return TableRow(
      children: [
        _Cell(text: id),
        _Cell(text: name),
        _Cell(text: city),
      ],
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;

  const _HeaderCell({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final String text;

  const _Cell({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
