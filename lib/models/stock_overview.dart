class StockOverview {
  final int totalProducts;
  final int totalStockQuantity;
  final double totalStockValue;
  final int activeAlerts;

  StockOverview({
    required this.totalProducts,
    required this.totalStockQuantity,
    required this.totalStockValue,
    required this.activeAlerts,
  });

  factory StockOverview.fromJson(Map<String, dynamic> json) {
    return StockOverview(
      totalProducts: json['total_products'],
      totalStockQuantity: json['total_stock_quantity'],
      totalStockValue: (json['total_stock_value'] as num).toDouble(),
      activeAlerts: json['active_alerts'],
    );
  }
}
