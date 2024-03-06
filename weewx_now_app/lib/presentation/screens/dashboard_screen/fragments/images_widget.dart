import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewx_now/presentation/bloc/dashboard_screen/dashboard_screen_bloc.dart';

class ImagesWidget extends StatefulWidget {
  const ImagesWidget({super.key});

  @override
  State<ImagesWidget> createState() => _ImagesWidgetState();
}

class _ImagesWidgetState extends State<ImagesWidget> {
  double _selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardScreenBloc, DashboardScreenState>(
      builder: (context, state) {
        if (state is DashboardData && state.settings.extras.hideImageViewer != true) {
          return _imageViewer(state);
        }
        return const SizedBox();
      },
    );
  }

  Widget _imageViewer(DashboardData data) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: SizedBox(
                child: Image.network(
                  '${data.endpoint.url}/images/001_webcam1/webcam_0_24012706041100.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              color: Colors.black12,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedImage--;
                      });
                    },
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.orangeAccent,
                        thumbColor: Colors.red,
                        //thumbShape: TimeSliderThumbShape(),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 15.0),
                      ),
                      child: Slider(
                        min: 0,
                        max: 30,
                        value: _selectedImage,
                        divisions: 31,
                        label: _selectedImage.toInt().toString(),
                        onChanged: (value) {
                          setState(() {
                            _selectedImage = value;
                          });
                        },
                        onChangeEnd: (value) => {
                          // setState(() {
                          //   _selectedImage = value;
                          // }),
                        },
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedImage++;
                      });
                    },
                    child: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (data.images.images.length > 1)
          Align(
            alignment: Alignment.topRight,
            child: DropdownMenu(
              //initialSelection: data.selectedCategory.id,
              enableFilter: false,
              enableSearch: true,
              requestFocusOnTap: false,
              dropdownMenuEntries: data.images.images.map<DropdownMenuEntry<String>>((e) => DropdownMenuEntry(value: e.category, label: e.category)).toList(),
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
