#library("Test:Test0");
#import("dart:mirrors");

class Test<X> {
  X abc;
  int hello = 0;
}

void main() {
  num num0 = 1;
  double double0 = 2.0;
  int int0 = 9223372036854775808 - 1;
  var var0 = 1;

  String string0 = "恒中文IamString";
  bool bool0 = true;
  String null0 = null;

  Test test0 = new Test<List<int>>();

  show("num0", num0);

  show("double0", double0);

  show("int0", int0);

  show("string0", string0);

  show("bool0", bool0);

  show("null0", null0);

  show("var0", var0);

  show("test0", test0);


}

show(String pre, var obj) {
  var mirror = currentMirrorSystem();
  InstanceMirror self = reflect(obj);
  print("$pre:[${self.type.simpleName}]");
  print("$pre:lib[${self.type.owner.simpleName}]");
//TODO, Dart not implement it yet
//  if (!self.type.typeVariables.isEmpty()) {
//    self.type.typeVariables.forEach((m) {
//      print("$pre:generic[${m.simpleName}]");
//      print("$pre:generic.upperBound[${m.upperBound.simpleName}]");
//    });
//  }
  print(" --- ");
}