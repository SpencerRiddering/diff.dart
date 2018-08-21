library diff3_dig_test;

import "package:test/test.dart";

import "package:diff/diff.dart";

void defineTests() {
  group('diff3_dig', () {
    test('multiline difference', () {
      // base
      String o = "AA ZZ 00 M 99".split(" ").join("\n");

      // ours
      String a = "AA a b c ZZ new 00 a a M 99".split(" ").join("\n");

      // theirs
      String b = "AA a d c ZZ 11 M z z 99".split(" ").join("\n");

      Diff3DigResult diff3DigResult = diff3Dig(a, o, b);

      expect(diff3DigResult, isNotNull);
      expect(diff3DigResult.conflict, isTrue);
      String expectResultText = """AA
a
<<<<<<<<<
b
=========
d
>>>>>>>>>
c
ZZ
<<<<<<<<<
new
00
a
a
=========
11
>>>>>>>>>
M
z
z
99""";
      String actualResultText = diff3DigResult.text.join("\n");
      expect(actualResultText, equals(expectResultText));
    });
  });

}

void main() {
  defineTests();
}
