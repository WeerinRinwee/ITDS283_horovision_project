// class Sign2 {
//   final String Details;
//   final String CZName;
//   final String Picture;
//   const Sign2(
//       {
//       required this.Details,
//       required this.CZName,
//       required this.Picture,
//       });

//   factory Sign2.fromJson(Map<String, dynamic> json) {
//     return Sign2(
//       // userId: json['userId'],
//       // id: json['id'],
//       // title: json['title'],
//       Details: json['Details'],
//       CZName: json['CZName'],
//       Picture: json['Picture'],
//     );
//   }
// }

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// To parse this JSON data, do
//
//     final sign2 = sign2FromJson(jsonString);

import 'dart:convert';

List<Sign2> sign2FromJson(String str) => List<Sign2>.from(json.decode(str).map((x) => Sign2.fromJson(x)));

String sign2ToJson(List<Sign2> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sign2 {
    Sign2({
        required this.czName,
        required this.picture,
        required this.details,
    });

    String czName;
    String picture;
    String details;

    factory Sign2.fromJson(Map<String, dynamic> json) => Sign2(
        czName: json["CZName"],
        picture: json["Picture"],
        details: json["Details"],
    );

    Map<String, dynamic> toJson() => {
        "CZName": czName,
        "Picture": picture,
        "Details": details,
    };
    
}
