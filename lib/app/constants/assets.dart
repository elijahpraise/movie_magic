extension AssetStringExt on String {
  String get png => 'assets/images/$this.png';
  String get gif => 'assets/images/$this.gif';
  String get jpg => 'assets/images/$this.jpg';
  String get jpeg => 'assets/images/$this.jpeg';
  String get svg => 'assets/svg/$this.svg';
  String get lottie => 'assets/lottie/$this.json';
}

class Assets {
  Assets._();

  static String movie = 'movie'.lottie;
}
