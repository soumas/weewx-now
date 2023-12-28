import 'package:flutter/material.dart';

class HeadlineRow extends StatelessWidget {
  const HeadlineRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        bottom: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Wetterstation 1',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          PopupMenuButton(
            icon: const Icon(Icons.menu),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text('Einstelungen'),
                onTap: () {},
              ),
              PopupMenuItem(
                child: const Text('Impressum'),
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
