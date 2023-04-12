import 'package:dartz/dartz.dart';
import 'package:finance/data_source/api_remote.dart';
import 'package:finance/postFields/register.dart';
import 'package:finance/repo_source/api_repository.dart';
import 'package:injectable/injectable.dart';

import '../network/handle_network_call.dart';
import '../responses/user_response.dart';

@LazySingleton(as: ApiRepository)
class ApiRepositoryImpl implements ApiRepository {
  final HandleNetworkCall networkCall;
  final RemoteSource remoteSource;
  ApiRepositoryImpl({required this.networkCall,required this.remoteSource});
@override
  Future<Either<String, UserResponse>> registerUser(
      RegisterParams params) async {
    try {
      final _res = await remoteSource.registerUser(params);

      if (_res.error?.isNotEmpty == true) return Left(_res.error!);

      final _user = _res.user;
      // if (_user != null) await localSource.setUser(_user);
      // await localSource.setAgent(_res.agent);

      return Right(_res);
    } catch (e) {
      final _failureMessage = networkCall.returnFailure(e);
      return Left(_failureMessage);
    }
  }
  Future<Either<String,UserResponse>>loginUser(
  String email,
  String password
) async {
 try {
      final _res = await remoteSource.loginUser(email, password);

      if (_res.error?.isNotEmpty == true) return Left(_res.error!);

      final _user = _res.user;
      // if (_user != null) await localSource.setUser(_user);
      // await localSource.setAgent(_res.agent);

      return Right(_res);
    } catch (e) {
      final _failureMessage = networkCall.returnFailure(e);
      return Left(_failureMessage);
    }
}
 Future<Either<String,UserResponse>>registerUsers(
  String phone,
  String email,
  String fname,
  String lname,
          
) async {
 try {
      final _res = await remoteSource.registerUsers(phone,email,fname,lname);

      if (_res.error?.isNotEmpty == true) return Left(_res.error!);

      final _user = _res.user;
      // if (_user != null) await localSource.setUser(_user);
      // await localSource.setAgent(_res.agent);

      return Right(_res);
    } catch (e) {
      final _failureMessage = networkCall.returnFailure(e);
      return Left(_failureMessage);
    }
}
}

