import 'package:flutter/material.dart';
import 'package:weewx_now/util/responsive_utils.dart';

class ResponsiveTable extends StatelessWidget {
  const ResponsiveTable({
    super.key,
    required List<String> images,
  }) : _images = images;

  final List<String> _images;

  @override
  Widget build(BuildContext context) {
    int cols = (ScreenSizeExt.of(context) == ScreenSize.large ? 2 : 1);
    return Table(
      children: [
        for (int i = 0; i < _images.length;)
          TableRow(
            children: [
              for (int j = 0; j < cols; i++, j++)
                if (i < _images.length)
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: EdgeInsets.only(top: 4, bottom: 4, left: (cols > 0 && j > 0) ? 4 : 0, right: (cols > 0 && j < cols - 1) ? 4 : 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade100, width: 2),
                      color: Colors.white,
                    ),
                    child: Image.network(
                      _images[i],
                    ),
                  )
                else
                  const SizedBox()
            ],
          )
      ],
    );
  }
}
