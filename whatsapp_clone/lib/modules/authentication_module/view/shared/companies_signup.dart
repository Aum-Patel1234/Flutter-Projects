
part of 'src/repo.dart';

class CompaniesSignUp extends StatelessWidget {
  const CompaniesSignUp({
    super.key, required this.text, required this.imageAddress, required this.imageWidth,
  });

  final String text;
  final String imageAddress;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light ? Colors.black38 : Colors.white30, 
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Aligns children at the start of the row
        children: [
          SizedBox(
            width: imageWidth,
            child: Center(child: Image.asset(imageAddress)),
          ), // Adjust spacing between image and text as needed
          Expanded(
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
