#import("dart:core");
#import("dart:math");

void main() {
  int v = 123456;
  String vs = v.toRadixString(15);
  print(vs);
  int v2 = parseInt(vs);
}