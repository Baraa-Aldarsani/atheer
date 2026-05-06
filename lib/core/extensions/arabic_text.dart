class ArabicText {
  static final _diacritics = RegExp('[\u064B-\u0652\u0670\u0640\u06D6-\u06ED]');

  static String normalize(String input) {
    var text = input.replaceAll(_diacritics, '');
    text = text
        .replaceAll('\u0622', '\u0627')
        .replaceAll('\u0623', '\u0627')
        .replaceAll('\u0625', '\u0627')
        .replaceAll('\u0671', '\u0627')
        .replaceAll('\u0649', '\u064A')
        .replaceAll('\u0629', '\u0647')
        .replaceAll('\u0624', '\u0648')
        .replaceAll('\u0626', '\u064A');
    return text.trim();
  }
}
