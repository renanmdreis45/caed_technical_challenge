import 'dart:convert';

import 'package:caed_technical_challenge/domain/entities/package.dart';

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
  DateTime dateReceived;
  DateTime dateOpen;
  DateTime dateRead;
  DateTime dateReturned;
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

  BoxModel copyWith({
    String? id,
    String? codigo,
    String? pontoEntrega,
    String? municipio,
    String? escola,
    String? etapa,
    String? componente,
    int? recebidos,
    int? faltantesRecebimento,
    int? devolvidos,
    int? faltantesDevolucao,
    DateTime? dateReceived,
    DateTime? dateOpen,
    DateTime? dateRead,
    DateTime? dateReturned,
    List<PackageModel>? packages,
  }) =>
      BoxModel(
        id: id ?? this.id,
        codigo: codigo ?? this.codigo,
        pontoEntrega: pontoEntrega ?? this.pontoEntrega,
        municipio: municipio ?? this.municipio,
        escola: escola ?? this.escola,
        etapa: etapa ?? this.etapa,
        componente: componente ?? this.componente,
        recebidos: recebidos ?? this.recebidos,
        faltantesRecebimento: faltantesRecebimento ?? this.faltantesRecebimento,
        devolvidos: devolvidos ?? this.devolvidos,
        faltantesDevolucao: faltantesDevolucao ?? this.faltantesDevolucao,
        dateReceived: dateReceived ?? this.dateReceived,
        dateOpen: dateOpen ?? this.dateOpen,
        dateRead: dateRead ?? this.dateRead,
        dateReturned: dateReturned ?? this.dateReturned,
        packages: packages ?? this.packages,
      );

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
        dateReceived: DateTime.parse(json["dateReceived"]),
        dateOpen: DateTime.parse(json["dateOpen"]),
        dateRead: DateTime.parse(json["dateRead"]),
        dateReturned: DateTime.parse(json["dateReturned"]),
        packages: List<PackageModel>.from(
            json["packages"].map((x) => PackageModel.fromJson(x))),
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
        "dateReceived": dateReceived.toIso8601String(),
        "dateOpen": dateOpen.toIso8601String(),
        "dateRead": dateRead.toIso8601String(),
        "dateReturned": dateReturned.toIso8601String(),
        "packages": packages
      };
}
