class CampaignModel {
  final String id;
  final String brandName;
  final String title;
  final String description;
  final String expiryDate;
  final bool isCombinable;

  CampaignModel({
    required this.id,
    required this.brandName,
    required this.title,
    required this.description,
    required this.expiryDate,
    this.isCombinable = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CampaignModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  static List<CampaignModel> get mockCampaigns => [
        CampaignModel(
          id: "1",
          brandName: "Secil Store",
          title: "Bahar Coşkusuyla Coin Katlama",
          description:
              "Baharı enerjisini alışverişlerine taşı! Şimdi alışveriş yaptıkça kazandığın Soty Coin'ler tam 3 katı değerinde hesabına yansıyor.",
          expiryDate: "01 Temmuz",
          isCombinable: false,
        ),
        CampaignModel(
          id: "2",
          brandName: "Secil Store",
          title: "Tüm Ürünlerde %20 İndirim",
          description:
              "Tüm ürünlerde geçerli %20 indirim fırsatıyla favori ürünlerinizi şimdi daha avantajlı fiyatlarla alın. Kampanya sınırlı süreyle geçerli!",
          expiryDate: "02 Eylül",
          isCombinable: true,
        ),
      ];
}
