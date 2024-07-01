import 'package:stocks_app/model/companies_model.dart';

class CompaniesState{}

class CompaniesInitialState extends CompaniesState{}

class CompaniesLoadingState extends CompaniesState{}

class CompaniesLoadedState extends CompaniesState{
  final List<CompaniesModel> companies;

  CompaniesLoadedState({required this.companies});
}
