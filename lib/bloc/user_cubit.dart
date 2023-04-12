import 'package:bloc/bloc.dart';
import 'package:finance/postFields/register.dart';
import 'package:finance/repo_source/api_repository.dart';
import 'package:finance/responses/user_response.dart';
import 'package:injectable/injectable.dart';
part 'user_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.repository}) : super(AuthState());
  final ApiRepository repository;

  Future<void> registerUser(RegisterParams params) async {
    emit(state.copyWith(status: UserStatus.loading));
    final _registerEither = await repository.registerUser(params);

    return _registerEither.fold((failure) async {
      emit(state.copyWith(status: UserStatus.failure, message: failure));
    }, (res) {
      emit(state.copyWith(
        status: UserStatus.success,
        user: res,
        message: res.message,
      ));
    });
  }
  // 
   Future<void> registerUsers(final String phone, String email, String fname, String lname) async {
    emit(state.copyWith(status: UserStatus.loading));
    final _registerEither = await repository.registerUsers(phone, email, fname, lname);

    return _registerEither.fold((failure) async {
      emit(state.copyWith(status: UserStatus.failure, message: failure));
    }, (res) {
      emit(state.copyWith(
        status: UserStatus.success,
        user: res,
        message: res.message,
      ));
    });
  }
  // login
  Future<void>loginUser(String email, String password) async {
    emit(state.copyWith(status: UserStatus.loading));
    final _registerEither = await repository.loginUser(email, password);

    return _registerEither.fold((failure) async {
      emit(state.copyWith(status: UserStatus.failure, message: failure));
    }, (res) {
      emit(state.copyWith(
        status: UserStatus.success,
        user: res,
        message: res.message,
      ));
    });
  }

  // Future<void> resendVerificationCode() async {
  //   emit(state.copyWith(status: AuthStatus.loading));
  //   final _verificationEither = await repository.resendVerification();

  //   return _verificationEither.fold((failure) {
  //     emit(state.copyWith(
  //       status: AuthStatus.failure,
  //       message: failure,
  //     ));
  //   }, (response) {
  //     emit(state.copyWith(
  //       status: AuthStatus.verifySent,
  //       message: response.message,
  //     ));
  //   });
  // }

  // Future<void> verifyAccount(String code) async {
  //   emit(state.copyWith(status: AuthStatus.loading));
  //   final _accountEither = await repository.verifyAccount(code);

  //   return _accountEither.fold((failure) {
  //     emit(state.copyWith(
  //       status: AuthStatus.failure,
  //       message: failure,
  //     ));
  //   }, (response) {
  //     emit(state.copyWith(
  //       status: AuthStatus.success,
  //       user: response,
  //     ));
  //   });
  // }

  // Future<void> logOutUser() async {
  //   emit(state.copyWith(status: AuthStatus.loading));
  //   await repository.logOutUser();
  //   emit(state.copyWith(status: AuthStatus.logOut));
  // }
}
