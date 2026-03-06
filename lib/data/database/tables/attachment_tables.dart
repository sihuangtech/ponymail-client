part of '../database.dart';

class Attachments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get emailId => integer().named('email_id')();
  TextColumn get filename => text()();
  TextColumn get mimeType => text().named('mime_type')();
  IntColumn get size => integer()();
  TextColumn get localPath => text().named('local_path')();
  TextColumn get remoteFetchId => text().named('remote_fetch_id').nullable()();
}
