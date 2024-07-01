import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks_app/bloc/CompaniesBloc/companies_bloc.dart';
import 'package:stocks_app/bloc/CompaniesBloc/companies_event.dart';
import 'package:stocks_app/model/companies_model.dart';

class CompanyTile extends StatelessWidget {
  final CompaniesModel company;

  const CompanyTile({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: company.status.toLowerCase() == 'active'
          ? Colors.blueAccent.shade700
          : Colors.redAccent.shade100,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        onTap: (){
          context.read<CompaniesBloc>().add(CompaniesEventGetCompanyOverview(symbol: company.symbol));
        },
        title: Text(
          company.name,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              'Exchange: ${company.exchange}',
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ],
        ),
        // trailing: Text(
        //   company.symbol,
        //   style: const TextStyle(fontSize: 16, color: Colors.white),
        // ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }
}
