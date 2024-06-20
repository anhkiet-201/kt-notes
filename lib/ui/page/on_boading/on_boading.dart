import 'package:credential_manager/credential_manager.dart';
import 'package:flutter/material.dart';
import 'package:ktnotes/core/arch/domain/usecase/sign_in_with_google.dart';

class OnBoading extends StatelessWidget {
  const OnBoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await SignInWithGoogle()();
            }on CredentialException catch(e) {
              print(e.message);
            }
          },
          child: Text(
            'Login',
          ),
        ),
      ),
    );
  }
}
