extension CapitalizedText on String {
  String get capitalize =>
      isNotEmpty ? replaceRange(0, 1, substring(0, 1).toUpperCase()) : this;
}
