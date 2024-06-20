import 'package:ktnotes/core/arch/domain/repository/repository_provider.dart';
import 'package:ktnotes/core/base/base_usecases.dart';

/// Use case for signing a user out.
class SignOut extends BaseUsecases<Future<void>> with NotesRepositoryProvider {
  /// Executes the use case to sign the user out.
  @override
  Future<void> call() => notesRepository.signOut();
}

