import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddStationCheckFailedDialog extends StatelessWidget {
  const AddStationCheckFailedDialog({
    super.key,
    required this.error,
  });

  final Object? error;

  @override
  Widget build(BuildContext context) {
    final url = _evalRequestUrl();
    return PlatformAlertDialog(
      title: Center(
        child: Icon(
          PlatformIcons(context).error,
          color: Colors.red,
          size: 60,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (url != null) Text(AppLocalizations.of(context)!.addStationCheckFailedDialogErrorOnCalling(url)),
            Text(_evalErrorDetails(context)),
          ],
        ),
      ),
      actions: [
        PlatformDialogAction(
          child: Text(AppLocalizations.of(context)!.close),
          onPressed: () => context.pop(),
        )
      ],
    );
  }

  String? _evalRequestUrl() {
    final e = error;
    if (e is DioException) {
      return e.requestOptions.uri.toString();
    }
    return null;
  }

  String _evalErrorDetails(BuildContext context) {
    final e = error;
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return AppLocalizations.of(context)!.dioErrorTimeout;
        case DioExceptionType.badCertificate:
          return AppLocalizations.of(context)!.dioErrorBadCertificate;
        case DioExceptionType.badResponse:
          return AppLocalizations.of(context)!.dioErrorBadResponse(e.response?.statusCode ?? '?', e.response?.statusMessage ?? '?');
        case DioExceptionType.cancel:
        case DioExceptionType.connectionError:
          return AppLocalizations.of(context)!.dioErrorConnectionError;
        case DioExceptionType.unknown:
          if (e.response == null) {
            return AppLocalizations.of(context)!.dioErrorImpossible;
          } else if (e.message != null) {
            return e.message!;
          }
      }
    }
    return AppLocalizations.of(context)!.unknownError;
  }
}
