part of '../database.dart';

class Mailboxes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get accountId => integer().named('account_id')();
  TextColumn get name => text()();
  TextColumn get path => text()();
  TextColumn get type => text()();
  IntColumn get unreadCount =>
      integer().named('unread_count').withDefault(const Constant(0))();
}
