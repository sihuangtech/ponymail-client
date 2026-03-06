import 'package:flutter_test/flutter_test.dart';
import 'package:ponymail/core/utils/result.dart';

void main() {
  test('Result.ok should set success', () {
    final r = Result.ok(1);
    expect(r.isSuccess, isTrue);
    expect(r.data, 1);
  });

  test('Result.err should set failure', () {
    final r = Result.err<int>('x');
    expect(r.isSuccess, isFalse);
    expect(r.failure?.message, 'x');
  });
}
