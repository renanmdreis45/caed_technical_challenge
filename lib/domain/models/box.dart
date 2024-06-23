import 'dart:convert';

import 'package:caed_technical_challenge/domain/models/package.dart';

BoxModel boxModelFromJson(String str) => BoxModel.fromJson(json.decode(str));

String boxModelToJson(BoxModel data) => json.encode(data.toJson());

class BoxModel {
  String id;
  String codigo;
  String pontoEntrega;
  String municipio;
  String escola;
  String etapa;
  String componente;
  int recebidos;
  int faltantesRecebimento;
  int devolvidos;
  int faltantesDevolucao;
  String dateReceived;
  String dateOpen;
  String dateRead;
  String dateReturned;
  List<PackageModel> packages;

  BoxModel({
    required this.id,
    required this.codigo,
    required this.pontoEntrega,
    required this.municipio,
    required this.escola,
    required this.etapa,
    required this.componente,
    required this.recebidos,
    required this.faltantesRecebimento,
    required this.devolvidos,
    required this.faltantesDevolucao,
    required this.dateReceived,
    required this.dateOpen,
    required this.dateRead,
    required this.dateReturned,
    required this.packages,
  });

  String toRawJson() => json.encode(toJson());

  factory BoxModel.fromJson(Map<String, dynamic> json) => BoxModel(
        id: json["id"] ?? "",
        codigo: json["codigo"] ?? "",
        pontoEntrega: json["pontoEntrega"],
        municipio: json["municipio"],
        escola: json["escola"],
        etapa: json["etapa"],
        componente: json["componente"],
        recebidos: json["recebidos"] ?? 0,
        faltantesRecebimento: json["faltantesRecebimento"] ?? 0,
        devolvidos: json["devolvidos"] ?? 0,
        faltantesDevolucao: json["faltantesDevolucao"] ?? 0,
        dateReceived: json["dateReceived"] ?? "",
        dateOpen: json["dateOpen"] ?? "",
        dateRead: json["dateRead"] ?? "",
        dateReturned: json["dateReturned"] ?? "",
        packages: json["packages"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "pontoEntrega": pontoEntrega,
        "municipio": municipio,
        "escola": escola,
        "etapa": etapa,
        "componente": componente,
        "recebidos": recebidos,
        "faltantesRecebimento": faltantesRecebimento,
        "devolvidos": devolvidos,
        "faltantesDevolucao": faltantesDevolucao,
        "dateReceived": dateReceived,
        "dateOpen": dateOpen,
        "dateRead": dateRead,
        "dateReturned": dateReturned,
        "packages": packages
      };
}
