part of '../database.dart';

class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text()();
  TextColumn get displayName => text().named('display_name')();
  TextColumn get imapHost => text().named('imap_host')();
  IntColumn get imapPort => integer().named('imap_port')();
  BoolColumn get imapSsl =>
      boolean().named('imap_ssl').withDefault(const Constant(true))();
  TextColumn get smtpHost => text().named('smtp_host')();
  IntColumn get smtpPort => integer().named('smtp_port')();
  BoolColumn get smtpSsl =>
      boolean().named('smtp_ssl').withDefault(const Constant(true))();
  TextColumn get passwordKey => text().named('password_key')();
  IntColumn get color => integer()();
  TextColumn get signature => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
}
