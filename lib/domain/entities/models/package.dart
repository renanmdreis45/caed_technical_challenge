import 'dart:convert';

PackageModel packageModelFromJson(String str) => PackageModel.fromJson(json.decode(str));

String packageModelToJson(PackageModel data) => json.encode(data.toJson());

class PackageModel {
  String id;
  bool isReceived;
  String receivedDate;
  bool isReturned;
  String returnedDate;

  PackageModel({
    required this.id,
    required this.isReceived,
    required this.receivedDate,
    required this.isReturned,
    required this.returnedDate,
  });

  String toRawJson() => json.encode(toJson());

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
        id: json["id"] ?? "",
        isReceived: json["isReceived"] ?? false,
        receivedDate: json["receivedDate"] ?? "",
        isReturned: json["isReturned"] ?? false,
        returnedDate: json["returnedDate"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isReceived": isReceived,
        "receivedDate": receivedDate,
        "isReturned": isReturned,
        "returnedDate": returnedDate,
      };
}
