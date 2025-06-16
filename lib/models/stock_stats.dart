class TopProductStat {
  final String productName;
  final int totalOut;

  TopProductStat({required this.productName, required this.totalOut});

  factory TopProductStat.fromJson(Map<String, dynamic> json) {
    return TopProductStat(
      productName: json['product__name'],
      totalOut: json['total_out'],
    );
  }
}

class RuptureStat {
  final String productName;
  final int nbRuptures;

  RuptureStat({required this.productName, required this.nbRuptures});

  factory RuptureStat.fromJson(Map<String, dynamic> json) {
    return RuptureStat(
      productName: json['product__name'],
      nbRuptures: json['nb_ruptures'],
    );
  }
}

class StockEvolution {
  final DateTime day;
  final int total;

  StockEvolution({required this.day, required this.total});

  factory StockEvolution.fromJson(Map<String, dynamic> json) {
    return StockEvolution(
      day: DateTime.parse(json['day']),
      total: json['total'],
    );
  }
}

class StockStats {
  final List<TopProductStat> topProducts;
  final List<RuptureStat> ruptures;
  final List<StockEvolution> evolution;

  StockStats({
    required this.topProducts,
    required this.ruptures,
    required this.evolution,
  });

  factory StockStats.fromJson(Map<String, dynamic> json) {
    return StockStats(
      topProducts: (json['top_products'] as List)
          .map((e) => TopProductStat.fromJson(e))
          .toList(),
      ruptures: (json['ruptures'] as List)
          .map((e) => RuptureStat.fromJson(e))
          .toList(),
      evolution: (json['evolution'] as List)
          .map((e) => StockEvolution.fromJson(e))
          .toList(),
    );
  }
}
