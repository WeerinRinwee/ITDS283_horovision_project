class Sign {
  final String about;
  final String career;
  final String compatibility;
  final String date_range;
  final String element;
  final String health;
  final String love;
  final String man;
  final String name;
  final String nature;
  final String relationship;
  final String ruling_planet;
  final String strengths;
  final String symbol;
  final String weaknesses;
  final String woman;

  const Sign(
      {required this.about,
      required this.career,
      required this.compatibility,
      required this.date_range,
      required this.element,
      required this.health,
      required this.love,
      required this.man,
      required this.name,
      required this.nature,
      required this.relationship,
      required this.ruling_planet,
      required this.strengths,
      required this.symbol,
      required this.weaknesses,
      required this.woman});

  factory Sign.fromJson(Map<String, dynamic> json) {
    return Sign(
      // userId: json['userId'],
      // id: json['id'],
      // title: json['title'],
      about: json['about'],
      career: json['career'],
      compatibility: json['compatibility'],
      date_range: json['date_range'],
      element: json['element'],
      health: json['health'],
      love: json['love'],
      man: json['man'],
      name: json['name'],
      nature: json['nature'],
      relationship: json['relationship'],
      ruling_planet: json['ruling_planet'],
      strengths: json['strengths'],
      symbol: json['symbol'],
      weaknesses: json['weaknesses'],
      woman: json['woman'],
    );
  }
}