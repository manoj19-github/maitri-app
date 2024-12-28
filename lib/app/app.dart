import 'package:api_repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:maitri_app/app/view/app_view.dart';

class App extends StatelessWidget {
  const App({super.key, required this.apiRepository});
  final ApiRepository apiRepository;

  @override
  Widget build(BuildContext context) {
    return AppView(apiRepository: apiRepository);
  }
}
