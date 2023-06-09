import 'package:dio/dio.dart';

Map<String, String>? formDataToMap(FormData? formData) {
  if (formData == null) return null;
  Map<String, String> json = {};
  for (var entry in formData.fields) {
    json[entry.key] = entry.value;
  }
  return json;
}
