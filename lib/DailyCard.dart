/// To parse this JSON data, do
//
//     final dailyCard = dailyCardFromJson(jsonString);

import 'dart:convert';

DailyCard dailyCardFromJson(String str) => DailyCard.fromJson(json.decode(str));

String dailyCardToJson(DailyCard data) => json.encode(data.toJson());

class DailyCard {
    DailyCard({
        required this.nhits,
        required this.cards,
    });

    final int nhits;
    final List<Cards> cards;

    factory DailyCard.fromJson(Map<String, dynamic> json) => DailyCard(
        nhits: json["nhits"],
        cards: List<Cards>.from(json["cards"].map((x) => Cards.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nhits": nhits,
        "cards": List<dynamic>.from(cards.map((x) => x.toJson())),
    };
}

class Cards {
    Cards({
        required this.name,
        required this.nameShort,
        required this.value,
        required this.valueInt,
        required this.suit,
        required this.type,
        required this.meaningUp,
        required this.meaningRev,
        required this.desc,
    });

    final String name;
    final String nameShort;
    final String value;
    final int valueInt;
    final String? suit;
    final String type;
    final String meaningUp;
    final String meaningRev;
    final String desc;

    factory Cards.fromJson(Map<String, dynamic> json) => Cards(
        name: json["name"],
        nameShort: json["name_short"],
        value: json["value"],
        valueInt: json["value_int"],
        suit: json["suit"],
        type: json["type"],
        meaningUp: json["meaning_up"],
        meaningRev: json["meaning_rev"],
        desc: json["desc"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "name_short": nameShort,
        "value": value,
        "value_int": valueInt,
        "suit": suit,
        "type": type,
        "meaning_up": meaningUp,
        "meaning_rev": meaningRev,
        "desc": desc,
    };
}
