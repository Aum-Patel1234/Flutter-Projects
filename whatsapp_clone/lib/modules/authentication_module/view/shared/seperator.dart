part of 'src/repo.dart';

class Seperator extends StatelessWidget {
  const Seperator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider( thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('OR', style: TextStyle( fontSize: 16)),
        ),
        Expanded(child: Divider(thickness: 1)),
      ],
    );
  }
}
