//#import('package:i18n/intl.dart');

String format(String pattern) {
  print("---");
  print(pattern);
  RegExp rexp = const RegExp(r"{[A-Za-z0-9_]+}");
  print("rexp:$rexp");
  Iterable<Match> matches = rexp.allMatches(pattern);
  for (Match m in matches) {
    String match = m.group(0);
    print(m.start);
    print(match);
  }
//  print(pattern.split(@"\$\{[A-Zz-z0-9_]+\}"));
}
//today(date) => Intl.message(
//    "Today's date is $date",
//    desc: 'Indicate the current date',
//    examples: {'date' : 'June 8, 2012'});

String format0(int a) {
  return "abc${a}";
}

void main() {
  String str = "abcd?{0}hijk?{1}?{0}mno";
  format(str);

  String x = format0(17);
  print(x);


//  print("intl-------");
//  print(today(new Date.now()));
}
