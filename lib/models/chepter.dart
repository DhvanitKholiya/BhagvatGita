class Chapters {
  int chapterNumber;
  int versesCount;
  String name;
  String translation;
  String transliteration;

  Chapters({
    required this.chapterNumber,
    required this.versesCount,
    required this.name,
    required this.translation,
    required this.transliteration,
  });

  factory Chapters.fromJson({required Map json}) {
    return Chapters(
        chapterNumber: json['chapter_number'],
        versesCount: json['verses_count'],
        name: json['name'],
        translation: json['translation'],
        transliteration: json['transliteration']);
  }
}
