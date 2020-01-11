//Use dart.io for lookup method.
import 'dart:io';
class Internet{

 Future  <bool> checkConnectivity() async {
   bool connect;
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connect = true;
    }
  } on SocketException catch (_) {
    connect = false;
  }
  return connect;
}}
