import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:immersetodo/config/constants.dart';

final clientProvider = Provider<Client>((ref) {
  Client client = Client();
  return client
    ..setEndpoint(apiUrl)
    ..setProject(projectUrl)
    ..setSelfSigned(status: true);
});

final accountProvider = Provider<Account>((ref) {
  return Account(ref.watch(clientProvider));
});
