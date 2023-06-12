import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connecteo/connecteo.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  final dataConnectionChecker = ConnectionChecker();
  return NetworkInfoImpl(dataConnectionChecker);
});

class NetworkInfoImpl implements NetworkInfo {
  final ConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.isConnected;
}
