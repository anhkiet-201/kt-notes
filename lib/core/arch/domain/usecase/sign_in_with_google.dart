import 'package:credential_manager/credential_manager.dart';
import 'package:ktnotes/core/arch/domain/repository/repository_provider.dart';
import 'package:ktnotes/core/base/base_usecases.dart';

/// Use case for signing in with Google.
class SignInWithGoogle extends BaseUsecases<Future<void>> with NotesRepositoryProvider {
  final CredentialManager _credentialManager = CredentialManager();

  /// Executes the use case to sign in with Google.
  @override
  Future<void> call() async {
    if (_credentialManager.isSupportedPlatform) { 
      // Initialize the credential manager for Google sign-in.
      await _credentialManager.init(
        preferImmediatelyAvailableCredentials: true,
        googleClientId: '551014826419-v7r9hmai74h6ulhegukfelqt1eqb2duo.apps.googleusercontent.com'
        ); 
      
      // Attempt to save the Google credential.
      final googleIdTokenCredential = await _credentialManager.saveGoogleCredential(); 
      
      if (googleIdTokenCredential == null) {
        // Handle the case where credential retrieval fails.
        throw 'Error while sign in'; 
      }
      
      // Sign in using the obtained Google ID token.
      await notesRepository.signInWithGoogle(idToken: googleIdTokenCredential.idToken); 
    } else {
      // TODO: Handle for other platforms that don't support Google sign-in.
    }
  }
}

