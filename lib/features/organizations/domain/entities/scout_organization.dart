final class ScoutOrganization {
  const ScoutOrganization({
    required this.id,
    required this.name,
    required this.code,
    this.logoUrl,
  });

  final int id;
  final String name;
  final String code;
  final String? logoUrl;
}
