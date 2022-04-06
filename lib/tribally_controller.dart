part of tribally_sdk;

class TriballyController extends ChangeNotifier {

  TriballyController._(this._channel, this._triballyViewState) {
    _channel.setMethodCallHandler(_handleMethodCall);
  }

  final MethodChannel _channel;
  final _TriballyViewState _triballyViewState;

  static Future<TriballyController> _init(int id, _TriballyViewState triballyViewState) async {
    final methodChannel = MethodChannel('tribally/tribally_veiw_$id');
    // await methodChannel.invokeMethod('waitForInit');

    return TriballyController._(methodChannel, triballyViewState);
  }

  Future<dynamic> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      default:
        throw MissingPluginException();
    }
  }

  setPushToken(String pushToken) async {
    return await _channel.invokeMethod(
        'setPushToken',
        {
          'deviceToken': pushToken,
        }
    );
  }
}