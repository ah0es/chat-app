import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'rigester_state.dart';

class RigesterCubit extends Cubit<RigesterState> {
  RigesterCubit() : super(RigesterInitial());

  Future<void> regester({required email, required password}) async {
    emit(RigesterLoading());
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(RigesterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RigesterFailure(errorMessage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RigesterFailure(errorMessage: 'email-already-in-use'));
      }
    } on Exception {
      emit(RigesterFailure(errorMessage: 'something went wrong'));
    }
  }
}
