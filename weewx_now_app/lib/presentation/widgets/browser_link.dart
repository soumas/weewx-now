import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BrowserLink extends StatelessWidget {
  const BrowserLink({
    super.key,
    required this.text,
    required this.url,
  });

  final String text;
  final String url;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
        minimumSize: Size.zero,
      ),
      onPressed: () {
        launchUrlString(url);
      },
      child: Row(
        children: [
          Flexible(child: Text(text)),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Icon(
              Icons.open_in_browser,
              size: (Theme.of(context).textTheme.bodySmall?.fontSize ?? 12) * 1.4,
            ),
          )
        ],
      ),
    );
  }
}
