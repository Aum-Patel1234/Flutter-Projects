import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/CompaniesBloc/companies_event.dart';
import 'package:stocks_app/bloc/CompaniesBloc/companies_state.dart';
import 'package:stocks_app/model/companies_model.dart';
import 'package:stocks_app/service/api_service.dart';

class CompaniesBloc extends Bloc<CompaniesEvent,CompaniesState>{
  CompaniesBloc():super(CompaniesInitialState()){
    on<CompaniesEventFetchCompanies>(_onCompaniesEventFetchCompanies);
    on<CompaniesEventGetCompanyOverview>(_onCompaniesEventGetCompanyOverview);
  }

  FutureOr<void> _onCompaniesEventFetchCompanies(CompaniesEventFetchCompanies event, Emitter<CompaniesState> emit) {
    emit(CompaniesLoadingState());
    List<CompaniesModel> companies = [];
    for (int i = 1; i < event.data.length  ; i++) {
      List<dynamic> company = event.data.elementAt(i);
      companies.add(CompaniesModel.fromList(company));
    }
    emit(CompaniesLoadedState(companies: companies));
  }

  FutureOr<void> _onCompaniesEventGetCompanyOverview(CompaniesEventGetCompanyOverview event, Emitter<CompaniesState> emit) {
    ApiService api = ApiService();
    api.getCompanyOverview(event.symbol);
  }
}