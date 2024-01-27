import 'package:flutter/material.dart';
import 'package:weewx_now_app/presentationOLD/widgets/key_value_table.dart';

class WeatherDataTable extends StatelessWidget {
  const WeatherDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: DropdownMenu(
            initialSelection: 'Current',
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Conditions',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const KeyValueTable(
              keyValuePairs: <String, String>{
                'Tracking Time': '12.11.2023 @ 15:36',
                'Outside Temperature': '6.2°C',
                'Heat Index': '4.7°C',
                'Wind Chill': '6.2°C',
                'Dew Point': '1.1°C',
                'Outside Humidity': '70%',
                'Barometer': '1007.6 mbar (-0.8)',
                'Wind': '2 km/h ESE (112°)',
                'Rain Today': '0.00 cm',
                'Rain Rate': '0.00 cm/h',
                'UV Index': '0.0',
                'Radiation': '102 W/m²',
                'Inside Temperature': '23.1°C',
                'Inside Humidity': '35%',
              },
            ),
          ],
        ),
      ],
    );
  }
}
