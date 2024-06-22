getPackagesProportions(
    int quantFaltantes, int quantComplementar) {
  int total = quantFaltantes + quantComplementar;
  double faltProportion = quantFaltantes / total;
  double comp_proportion = quantComplementar / total;

  Map<String, double> packagesProportions = {
    "faltantes": faltProportion,
    "complementares": comp_proportion,
  };

  return packagesProportions;
}

getTotalPackages(int quantFaltantes, int quantComplementar) {
  int total = quantFaltantes + quantComplementar;

  return total;
}
