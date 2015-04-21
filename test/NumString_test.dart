import "dart:core";

void main() {
  int v = 123456;
  String vs = v.toRadixString(15);
  print(vs);
  int v2 = int.parse(vs,radix: 15);
  print(v2);
}