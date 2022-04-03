import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tribally_sdk/extentions/color_extention.dart';

class TriballyView extends StatefulWidget {
  const TriballyView({
    Key? key,
    required this.displayName,
    required this.uid,
    required this.projectId,
    required this.apiKey,
    this.avatar,
    this.gestureRecognizers = const <Factory<OneSequenceGestureRecognizer>>{},
    this.primary,
    this.background,
    this.surface,
    this.text,
    this.divider,
    this.primaryDark,
    this.backgroundDark,
    this.surfaceDark,
    this.textDark,
    this.dividerDark,
  }) : super(key: key);

  final String displayName;
  final String uid;
  final String projectId;
  final String apiKey;
  final String? avatar;

  //primary color
  final Color? primary;

  //background color
  final Color? background;

  //surface color(post backgrounds)
  final Color? surface;

  //text color
  final Color? text;

  //divider color(optional)
  final Color? divider;

  //primary color for Dark Mode(optional)
  final Color? primaryDark;

  //background color for Dark Mode(optional)
  final Color? backgroundDark;

  //surface color for Dark Mode(optional)
  final Color? surfaceDark;

  //text color for Dark Mode(optional)
  final Color? textDark;

  //divider color for Dark Mode(optional)
  final Color? dividerDark;

  /// Which gestures should be consumed by the map.
  ///
  /// When this set is empty, the map will only handle pointer events for gestures that
  /// were not claimed by any other gesture recognizer.
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;

  static const String _viewType = 'tribally';

  @override
  _TriballyViewState createState() => _TriballyViewState();
}

class _TriballyViewState extends State<TriballyView> {
  @override
  Widget build(BuildContext context) {
    //if (_isLoading) return const CircularProgressIndicator();
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: TriballyView._viewType,
        onPlatformViewCreated: _onPlatformViewCreated,
        gestureRecognizers: widget.gestureRecognizers,
        creationParamsCodec: const StandardMessageCodec(),
        creationParams: _creationParams(),
      );
    } else {
      return UiKitView(
        viewType: TriballyView._viewType,
        onPlatformViewCreated: _onPlatformViewCreated,
        gestureRecognizers: widget.gestureRecognizers,
        creationParamsCodec: const StandardMessageCodec(),
        creationParams: _creationParams(),
      );
    }
  }

  Future<void> _onPlatformViewCreated(int id) async {}

  Map<String, dynamic> _creationParams() {
    final settings = {
      'displayName': widget.displayName,
      'uid': widget.uid,
      'projectId': widget.projectId,
      'apiKey': widget.apiKey,
      'avatar': widget.avatar
    };
    final viewOptions = {
      'primary': '#'+ (widget.primary?.toHexString() ??
          Theme.of(context).primaryColor.toHexString()),
      'background': '#'+(widget.background?.toHexString() ??
          Theme.of(context).scaffoldBackgroundColor.toHexString()),
      'surface': '#'+(widget.surface?.toHexString() ??
          Theme.of(context).cardColor.toHexString()),
      'text': '#'+(widget.text?.toHexString() ?? Colors.black.toHexString()),
      'divider': '#'+(widget.divider?.toHexString() ??
          Theme.of(context).dividerColor.toHexString()),
      'primaryDark': '#'+(widget.primaryDark?.toHexString() ??
          Theme.of(context).primaryColorDark.toHexString()),
      //TODO coming soon
      // 'backgroundDark': widget.backgroundDark?.value ?? Theme.of(context).primaryColorDark.value,
      // 'surfaceDark': //surface color for Dark Mode(optional),
      // 'textDark': //text color for Dark Mode(optional),
      // 'dividerDark': widget.divider?.value ?? Theme.of(context).,
    };

    return {'viewOptions': viewOptions, 'settings': settings};
  }
}
