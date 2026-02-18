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
}
