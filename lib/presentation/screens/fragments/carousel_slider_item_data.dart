import 'package:flutter/material.dart';
import 'package:weewx_pwa/presentation/widgets/kev_value_table.dart';

class CarouselSliderItemData extends StatelessWidget {
  const CarouselSliderItemData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Current Conditions',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 10,
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
    );
  }
}
