List<String> packagesLabel = [
  "CÓDIGO",
  "PONTO DE ENTREGA",
  "MUNICÍPIO",
  "ESCOLA",
  "ANO ESCOLAR/ETAPA",
  "COMPONENTE CURRICULAR"
];

int calculaPorcentagem(int numerador, int denominador) {
  final porc = (numerador / denominador)*100;
  
  int result = porc.floor();
  print(result);
  return result;
}

// List<PackageModel> packages = [
//   PackageModel(id: '1', isReceived: true, receivedDate: '18/06/2024 14:32', isReturned: true, returnedDate: '20/06/2024 09:00', pontoEntrega: "1ª REGIAO", municipio: "ARACAJU/SE", escola: "EMEF DEPUTADO JAIME ARAUJO (28031121)", etapa: "2º ANO EF (ENSINO FUNDAMENTAL)", componente: "LÍNGUA PORTUGUESA"),
//   PackageModel(id: '2', isReceived: false, receivedDate: '', isReturned: false, returnedDate: '', pontoEntrega: "1ª REGIAO", municipio: "ARACAJU/SE", escola: "EMEF DEPUTADO JAIME ARAUJO (28031121)", etapa: "2º ANO EF (ENSINO FUNDAMENTAL)", componente: "LÍNGUA PORTUGUESA"),
//   PackageModel(id: '3', isReceived: true, receivedDate: '17/06/2024 19:43', isReturned: false, returnedDate: '', pontoEntrega: "1ª REGIAO", municipio: "ARACAJU/SE", escola: "EMEF DEPUTADO JAIME ARAUJO (28031121)", etapa: "2º ANO EF (ENSINO FUNDAMENTAL)", componente: "LÍNGUA PORTUGUESA"),
//   PackageModel(id: '4', isReceived: true, receivedDate: '17/06/2024 19:43', isReturned: false, returnedDate: '', pontoEntrega: "1ª REGIAO", municipio: "ARACAJU/SE", escola: "EMEF DEPUTADO JAIME ARAUJO (28031121)", etapa: "2º ANO EF (ENSINO FUNDAMENTAL)", componente: "LÍNGUA PORTUGUESA"),
//   PackageModel(id: '5', isReceived: true, receivedDate: '17/06/2024 19:43', isReturned: false, returnedDate: '', pontoEntrega: "1ª REGIAO", municipio: "ARACAJU/SE", escola: "EMEF DEPUTADO JAIME ARAUJO (28031121)", etapa: "2º ANO EF (ENSINO FUNDAMENTAL)", componente: "LÍNGUA PORTUGUESA"),
//   PackageModel(id: '6', isReceived: true, receivedDate: '17/06/2024 19:43', isReturned: false, returnedDate: '', pontoEntrega: "1ª REGIAO", municipio: "ARACAJU/SE", escola: "EMEF DEPUTADO JAIME ARAUJO (28031121)", etapa: "2º ANO EF (ENSINO FUNDAMENTAL)", componente: "LÍNGUA PORTUGUESA"),
//   PackageModel(id: '7', isReceived: true, receivedDate: '17/06/2024 19:43', isReturned: false, returnedDate: '', pontoEntrega: "1ª REGIAO", municipio: "ARACAJU/SE", escola: "EMEF DEPUTADO JAIME ARAUJO (28031121)", etapa: "2º ANO EF (ENSINO FUNDAMENTAL)", componente: "LÍNGUA PORTUGUESA"),
//   PackageModel(id: '8', isReceived: true, receivedDate: '17/06/2024 19:43', isReturned: false, returnedDate: '', pontoEntrega: "1ª REGIAO", municipio: "ARACAJU/SE", escola: "EMEF DEPUTADO JAIME ARAUJO (28031121)", etapa: "2º ANO EF (ENSINO FUNDAMENTAL)", componente: "LÍNGUA PORTUGUESA")
// ];
