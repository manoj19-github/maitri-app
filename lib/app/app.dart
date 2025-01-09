import 'package:api_repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:maitri_app/app/view/app_view.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App(
      {super.key, required this.apiRepository, required this.userRepository});
  final ApiRepository apiRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return AppView(
      apiRepository: apiRepository,
      userRepository: userRepository,
    );
  }
}
