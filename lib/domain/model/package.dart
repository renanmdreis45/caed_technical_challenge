import 'dart:convert';

PackageModel packageModelFromJson(String str) => PackageModel.fromJson(json.decode(str));

String packageModelToJson(PackageModel data) => json.encode(data.toJson());

class PackageModel {
  String id;
  bool isReceived;
  String receivedDate;
  bool isReturned;
  String returnedDate;
  String pontoEntrega;
  String municipio;
  String escola;
  String etapa;
  String componente;

  PackageModel({
    required this.id,
    required this.isReceived,
    required this.receivedDate,
    required this.isReturned,
    required this.returnedDate,
    required this.pontoEntrega,
    required this.municipio,
    required this.escola,
    required this.etapa,
    required this.componente,
  });

  String toRawJson() => json.encode(toJson());

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
        id: json["id"] ?? "",
        isReceived: json["isReceived"] ?? false,
        receivedDate: json["receivedDate"] ?? "",
        isReturned: json["isReturned"] ?? false,
        returnedDate: json["returnedDate"] ?? "",
        pontoEntrega: json["pontoEntrega"] ?? "",
        municipio: json["municipio"] ?? "",
        escola: json["escola"] ?? "",
        etapa: json["etapa"] ?? "",
        componente: json["componente"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isReceived": isReceived,
        "receivedDate": receivedDate,
        "isReturned": isReturned,
        "returnedDate": returnedDate,
        "pontoEntrega": pontoEntrega,
        "municipio": municipio,
        "escola": escola,
        "etapa": etapa,
        "componente": componente,
      };
}