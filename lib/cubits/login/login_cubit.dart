import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({required email, required password}) async {
    emit(LoginLoading());
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(LoginFailure(errorMessamge: 'weak password'));
      } else if (e.code == 'email-already-in-use') {
        emit(LoginFailure(errorMessamge: 'email already in use'));
      } else if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessamge: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errorMessamge: 'Wrong password provided.'));
      }
    } on Exception {
      emit(LoginFailure(errorMessamge: 'something went worng..'));
    }
  }
}
