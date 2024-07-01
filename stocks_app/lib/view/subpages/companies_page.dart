
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/CompaniesBloc/companies_bloc.dart';
import 'package:stocks_app/bloc/CompaniesBloc/companies_state.dart';
import 'package:stocks_app/widgets/companies_tile.dart';

class CompaniesPage extends StatelessWidget{
  const CompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompaniesBloc,CompaniesState>(
      builder: (context, state) {
        if(state is CompaniesLoadingState){
          return const Center(child: CircularProgressIndicator(color: Colors.red,));
        }
        else if(state is CompaniesLoadedState){
          return ListView.builder(
            itemCount: state.companies.length,
            itemBuilder: (context, index) {
              return CompanyTile(company: state.companies[index],);
            },
          );
        }
        return const Center(child: Text('No Data Found !'),);
      },
    );
  }
}