import 'package:flutter/material.dart';
import 'package:pokedex_sample/services/network_client/fetch_status.dart';

class FetchStatusWidget extends StatelessWidget {
  const FetchStatusWidget({
    super.key,
    required this.status,
    required this.loadingWidget,
    required this.errorWidget,
    required this.doneWidget,
    this.idleWidget,
  });

  final FetchStatus status;
  final Widget loadingWidget;
  final Widget errorWidget;
  final Widget doneWidget;
  final Widget? idleWidget;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case FetchStatus.done:
        return doneWidget;
      case FetchStatus.error:
        return errorWidget;
      case FetchStatus.loading:
        return loadingWidget;
      case FetchStatus.idle:
        return idleWidget ?? Container();
    }
  }
}
