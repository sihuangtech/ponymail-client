part of '../database.dart';

List<EmailAddressModel> _decodeAddresses(String raw) {
  final list = (jsonDecode(raw) as List<dynamic>)
      .map((item) => Map<String, dynamic>.from(item as Map))
      .toList();
  return list.map(EmailAddressModel.fromJson).toList();
}

List<String> _decodeStringList(String raw) {
  return (jsonDecode(raw) as List<dynamic>).map((item) => '$item').toList();
}
