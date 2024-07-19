enum MarriedStatus{
  married,
  single
}

class User{
  User({required this.name, required this.phoneNumber, required this.email, required this.age, required this.isMarried});

  final String name;
  final int phoneNumber;
  final String email;
  final int age;
  final bool isMarried;
}