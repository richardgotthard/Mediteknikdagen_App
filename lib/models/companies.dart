// To parse this JSON data, do
//
//     final companies = companiesFromJson(jsonString);

import 'dart:convert';

Companies companiesFromJson(String str) => Companies.fromJson(json.decode(str));

String companiesToJson(Companies data) => json.encode(data.toJson());

class Companies {
  Companies({
    required this.companies,
  });

  List<Company> companies;

  factory Companies.fromJson(Map<String, dynamic> json) => Companies(
        companies: List<Company>.from(
            json["companies"].map((x) => Company.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
      };
}

class Company {
  // ignore: prefer_typing_uninitialized_variables
  var partner;

  Company({
    required this.company,
    this.partner,
    required this.information,
    required this.logo,
  });

  String company;
  //Partner partner;
  List<String> information;
  String logo;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        company: json["company"],
        partner: json["partner"],
        information: List<String>.from(json["information"].map((x) => x)),
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "company": company,
        "partner": partner,
        "information": List<dynamic>.from(information.map((x) => x)),
        "logo": logo,
      };
}
