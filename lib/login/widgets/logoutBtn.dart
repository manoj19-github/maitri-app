import 'package:flutter/material.dart';
import 'package:powersync_repository/powersync_repository.dart';

class LogoutBtn extends StatelessWidget {
  const LogoutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> logoutHandler() async {
      return await Supabase.instance.client.auth.signOut();
    }

    return StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final session = snapshot.data?.session;
            if (session == null) return const SizedBox.shrink();
            return ElevatedButton.icon(
                onPressed: logoutHandler,
                icon: Icon(Icons.logout),
                label: Text('Logout',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.apply(color: Colors.red)));
          }
          return const SizedBox.shrink();
        });
  }
}
