extension StringExtensions on String {
  String get removeHtml => replaceAll(RegExp(r'<[^>]*>'), '');

  String get arabicNumber {
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    String result = this;
    for (int i = 0; i < 10; i++) {
      result = result.replaceAll('$i', arabic[i]);
    }
    return result;
  }
}
