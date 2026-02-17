final class ProductConstants {
  factory ProductConstants() => _instance;
  ProductConstants._();

  static final ProductConstants _instance = ProductConstants._();

  static ProductConstants get instance => _instance;

  final String appName = 'Soty Case';
}
