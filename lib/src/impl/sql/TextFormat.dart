/** Utility for formating messages */
class TextFormat {
  static final RegExp rexp = const RegExp(r"{[A-Za-z0-9_]+}");
  static String format(String txt, Map params) {
    StringBuffer sb = new StringBuffer();
    Iterable<Match> matches = rexp.allMatches(txt);
    int b = 0;
    for (Match m in matches) {
      String token = m.group(0);
      int e = m.start;
      sb.add(txt.substring(b, e));
      b = e + token.length;
      sb.add(params[token.substring(1, token.length-1)]);
    }
    return b == 0 ? txt : sb.add(txt.substring(b, txt.length)).toString();
  }
}
