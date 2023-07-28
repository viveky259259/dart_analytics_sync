class AdobeServer {
  AdobeServer({this.isConnected = true});

  // this will help in simulating internet connection
  final bool isConnected;
  Future<void> reportAction(
      final String eventName, final Map<String, dynamic> data) async {
    if (isConnected) {
      Future.delayed(Duration(milliseconds:300));
      print('action reported: $data');
      return;
    } else {
      await Future.delayed(Duration(seconds: 4));
      throw Exception();
    }
  }

  Future<void> reportState(
      final String eventName, final Map<String, dynamic> data) async {
    if (isConnected) {
      Future.delayed(Duration(milliseconds: 300));
      print('state reported: $data');
      return;
    } else {
      await Future.delayed(Duration(seconds: 4));
      throw Exception();
    }
  }
}
