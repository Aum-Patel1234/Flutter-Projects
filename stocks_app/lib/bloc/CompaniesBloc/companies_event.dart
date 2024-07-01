abstract class CompaniesEvent{}

class CompaniesEventFetchCompanies extends CompaniesEvent{
  final List<List<dynamic>> data;

  CompaniesEventFetchCompanies({required this.data});
}

class CompaniesEventGetCompanyOverview extends CompaniesEvent{
  final String symbol;

  CompaniesEventGetCompanyOverview({required this.symbol});
}
