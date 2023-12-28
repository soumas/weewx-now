import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({
    super.key,
  });

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  double _selectedImage = 30;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  child: Image.network(
                    'https://wetter.msgu.at/Content/images/webcam/_old/webcam_0_23110413534300.jpg',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            Container(
              color: Colors.black12,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.orangeAccent,
                        thumbColor: Colors.red,
                        //thumbShape: TimeSliderThumbShape(),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 15.0),
                      ),
                      child: Slider(
                        min: 0,
                        max: 30,
                        value: _selectedImage,
                        divisions: 30,
                        label: _selectedImage.round().toString(),
                        onChanged: (value) {
                          setState(() {
                            _selectedImage = value;
                          });
                        },
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: DropdownMenu(
            initialSelection: 'Webcam1',
            enableFilter: false,
            enableSearch: true,
            requestFocusOnTap: false,
            controller: TextEditingController(text: ''),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
            ),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 'Webcam1', label: 'Webcam 1'),
              DropdownMenuEntry(value: 'Webcam2', label: 'Webcam 2'),
              DropdownMenuEntry(value: 'Radar', label: 'Radar')
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            color: Colors.black12,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('16.03.2024 @ 15:35 Uhr'),
            ),
          ),
        )
      ],
    );
  }
}
