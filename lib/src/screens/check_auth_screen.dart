import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_crud_bakapp/src/screens/screens.dart';
import 'package:app_crud_bakapp/src/services/services.dart';

class CheckAuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            Future.microtask(
              () async {
                final resp = await authService.readToken();
                if (resp != '' && resp != null) {
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => HomeScreen(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                } else {
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => LoginScreen(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                }
              },
            );
            return Container();
          },
        ),
      ),
    );
  }
}
