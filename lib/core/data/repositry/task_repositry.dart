import 'package:dartz/dartz.dart';
import 'package:empty_code/core/data/models/common_response.dart';
import 'package:empty_code/core/data/models/task_model.dart';
import 'package:empty_code/core/data/models/token_info.dart';
import 'package:empty_code/core/data/models/update_task.dart';
import 'package:empty_code/core/data/models/users_model.dart';

import 'package:empty_code/core/enums/request_type.dart';
import 'package:empty_code/core/utils/network_util.dart';





class TaskRepository {
  Future<Either<String, TokenInfo>> login({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'api/login',
        body: {
          "email": email,
          "password": password,
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, TaskModel>> createtask({
    required String name,
    required String job,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'api/users',
        body: {
          "name": name,
          "job": job,
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(TaskModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }


   Future<Either<String, UpdateTask>> updatetask({
    required String name,
    required String job,
    required String? taskId
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.PUT,
        route: 'api/users/$taskId',
        body: {
          "name": name,
          "job": job,
        },
      ).then((value) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(UpdateTask.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

   Future<Either<String, bool>> DeletePost({
      required int taskId
    
  }
   ) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.DELETE,
        route: 'api/users/$taskId',
     
      
      ).then((value) {
        CommonResponse<Map<String, dynamic>>  commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

    Future<Either<String, UsersModel>> getUsers({required int pagenum}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        route: 'api/users?page=$pagenum',
      ).then((value) {
        print(value);
        CommonResponse<Map<String, dynamic>>  commonResponse =
            CommonResponse.fromJson(value);

        if (commonResponse.getStatus) {
          return Right(UsersModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message);
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}