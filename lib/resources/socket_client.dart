import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  SocketClient();
  IO.Socket? socket;
  static SocketClient? _Instance;
  SocketClient._internal() {
    socket = IO.io('http://192.168.164.40:8080', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
  }
  static SocketClient get instance {
    _Instance ??= SocketClient._internal();
    return _Instance!;
  }
}
