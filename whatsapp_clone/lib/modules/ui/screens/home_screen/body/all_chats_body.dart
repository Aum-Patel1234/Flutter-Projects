part of 'src/main_body.dart';

class AllChatsBody extends StatelessWidget {
  const AllChatsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchBar(
            hintText: 'Search..',
            onTap: (){
              showSearch(context: context, delegate: CustomSearchBar());
            },
          ),
        )
      ],
    );
  }
}