import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [
        
      ],
      child: child,
    );
  }
}