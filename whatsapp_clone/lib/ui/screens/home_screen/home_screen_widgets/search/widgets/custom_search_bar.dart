part of '../../src/home_screen_widgets.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<SearchUserBloc, SearchUserState>(
        builder: (context, state) {
          return SearchAnchor(
            builder: (context, searchController) {
              return SearchBar(
                hintText: 'Search',
                onTap: () {
                  searchController.openView();
                },
                trailing: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                ],
              );
            },
            suggestionsBuilder: (context, searchController) {
              context.read<SearchUserBloc>().add(SearchUserEventQueryChanged(query: searchController.text));

              final List<UserModel> suggestions = state.users;

              log(suggestions.toString());

              return List<ListTile>.generate(
                suggestions.length,
                (index) {
                  final user = suggestions[index];
                  return ListTile(
                    title: Text(user.username ?? user.email!.split('@')[0]),
                    onTap: () {
                      searchController.closeView(user.username);
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
