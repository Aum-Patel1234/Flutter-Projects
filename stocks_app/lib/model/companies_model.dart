class CompaniesModel {
  final String symbol;
  final String name;
  final String exchange;
  final String assetType;
  final String ipoDate;
  final String? delistingDate;
  final String status;

  CompaniesModel(
      {required this.symbol,
      required this.name,
      required this.exchange,
      required this.assetType,
      required this.ipoDate,
      required this.delistingDate,
      required this.status});

  factory CompaniesModel.fromList(List<dynamic> company) {
    return CompaniesModel(
      symbol: company.elementAt(0) as String,
      name: company.elementAt(1) as String,
      exchange: company.elementAt(2) as String,
      assetType: company.elementAt(3) as String,
      ipoDate: company.elementAt(4) as String,
      delistingDate: company.elementAt(5) as String?,
      status: company.elementAt(6) as String,
    );
  }
}
