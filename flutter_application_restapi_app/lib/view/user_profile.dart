import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_restapi_app/bloc/user_bloc.dart';
import 'package:flutter_application_restapi_app/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: ((context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state is UserProfile) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.user.name),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  _buildDetailRow('Username', state.user.username),
                  _buildDetailRow('Email', state.user.email),
                  _buildDetailRow('Phone', state.user.phone),
                  _buildDetailRow('Website', state.user.website),
                  const SizedBox(height: 16.0),
                  Text('Address',
                      style: Theme.of(context).textTheme.headlineMedium),
                  _buildDetailRow('Street', state.user.address.street),
                  _buildDetailRow('Suite', state.user.address.suite),
                  _buildDetailRow('City', state.user.address.city),
                  _buildDetailRow('Zipcode', state.user.address.zipcode),
                  _buildDetailRow('Geo',
                      '${state.user.address.geo.lat}, ${state.user.address.geo.lng}'),
                  const SizedBox(height: 16.0),
                  Text('Company',
                      style: Theme.of(context).textTheme.headlineMedium),
                  _buildDetailRow('Name', state.user.company.name),
                  _buildDetailRow(
                      'Catch Phrase', state.user.company.catchPhrase),
                  _buildDetailRow('BS', state.user.company.bs),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final Uri launchUri = Uri(
                  scheme: 'tel',
                  path: state.user.phone,
                );
                try {
                  await launchUrl(launchUri);
                } catch (e) {
                  log(e.toString());
                }
              },
              child: const Icon(
                Icons.call,
                size: 30,
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text(
              'No Data Found',
            ),
          ),
        );
      }),
    );
  }

  Widget _buildDetailRow(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(detail)),
        ],
      ),
    );
  }
}
