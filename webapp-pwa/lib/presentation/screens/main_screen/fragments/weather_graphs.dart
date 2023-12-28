import 'package:flutter/material.dart';
import 'package:weewx_pwa/presentation/widgets/responsive_table.dart';

class WeatherGraphs extends StatelessWidget {
  const WeatherGraphs({
    super.key,
    required List<String> images,
  }) : _images = images;

  final List<String> _images;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Graphen',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            ResponsiveTable(images: _images),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: DropdownMenu(
            initialSelection: 'Day',
            enableFilter: false,
            enableSearch: true,
            requestFocusOnTap: false,
            controller: TextEditingController(text: ''),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
            ),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 'Current', label: 'Current'),
              DropdownMenuEntry(value: 'Day', label: 'Day'),
              DropdownMenuEntry(value: 'Week', label: 'Week'),
              DropdownMenuEntry(value: 'Month', label: 'Month'),
              DropdownMenuEntry(value: 'Year', label: 'Year'),
            ],
          ),
        ),
      ],
    );
  }
}
