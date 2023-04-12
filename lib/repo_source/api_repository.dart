import 'package:finance/postFields/register.dart';
import 'package:finance/responses/user_response.dart';
import 'package:dartz/dartz.dart';

abstract class ApiRepository {
   Future<Either<String, UserResponse>> registerUser(RegisterParams params);
  Future<Either<String, UserResponse>> loginUser(String email,String password);
  Future<Either<String, UserResponse>>registerUsers(
          String phone,
          String email,
          String fname,
          String lname,
          );

}