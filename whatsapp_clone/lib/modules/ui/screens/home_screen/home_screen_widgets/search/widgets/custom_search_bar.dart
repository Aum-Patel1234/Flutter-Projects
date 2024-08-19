part of '../../src/home_screen_widgets.dart';

class CustomSearchBar extends SearchDelegate{
  CustomSearchBar({super.searchFieldLabel, super.searchFieldStyle, super.searchFieldDecorationTheme, super.keyboardType, super.textInputAction, this.groupModel});
  
  final GroupModel? groupModel;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        query = '';
        // When pressed here the query will be cleared from the search bar.
      },
    ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
        // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    SearchUserBloc().add(SearchUserEventQueryChanged(query: query));

    return BlocBuilder<SearchUserBloc, SearchUserState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final results = state.users.where((user) => user.email!.toLowerCase().contains(query.toLowerCase())).toList();

        if (results.isEmpty) {
          return const Center(child: Text('No users found.'));
        }

        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final user = results[index];
            return ListTile(
              title: Text(user.email!.split('@')[0]),
              onTap: () {
                if(groupModel != null){
                  GroupsService service = GroupsService();
                  service.addUser(user: user, group: groupModel!);
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(sender: context.read<AuthBloc>().state.user!, receiver: user)));
                }
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<SearchUserBloc>().add(SearchUserEventQueryChanged(query: query));
    return BlocBuilder<SearchUserBloc,SearchUserState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.users.length,
          itemBuilder: (context, index) {
            UserModel user = state.users.elementAt(index);
            return ListTile(
              title: Text(user.email!.split('@')[0]),
              onTap: (){
                if(groupModel != null){
                  GroupsService service = GroupsService();
                  service.addUser(user: user, group: groupModel!);  
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(sender: context.read<AuthBloc>().state.user!, receiver: user)));
                }
              },
            );
          },
        );
      },
    );
  }
}
