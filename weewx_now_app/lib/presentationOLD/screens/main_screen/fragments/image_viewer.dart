import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewx_now/presentationOLD/cubit/cubit/image_viewer_cubit.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({
    super.key,
  });

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  double _selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageViewerCubit, ImageViewerState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case == ImageViewerData:
            return _imageViewer(state as ImageViewerData);
          case == NoImageViewerData:
            return _noImage(state as ImageViewerData);
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget _noImage(ImageViewerData data) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: !data.settings.now.hideImageViewer
            ? const Text('No imagage available. If you are the administrator of the endpoint and displaying an image is not intended, please consider the '
                'hideImageViewer'
                ' option in the weewx.config.')
            : null,
      ),
    );
  }

  Widget _imageViewer(ImageViewerData data) {
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
                    '${data.settings.now.endpoint}/images/${data.selectedImage.category.id}/${data.selectedImage.data}',
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
        if (data.images.map.length > 1)
          Align(
            alignment: Alignment.topRight,
            child: DropdownMenu(
              initialSelection: data.selectedCategory.id,
              enableFilter: false,
              enableSearch: true,
              requestFocusOnTap: false,
              dropdownMenuEntries: data.images.map.entries.map<DropdownMenuEntry<String>>((e) => DropdownMenuEntry(value: e.key.id, label: e.key.id)).toList(),
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
