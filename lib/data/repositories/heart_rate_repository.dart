import 'package:dartz/dartz.dart';

import 'package:devera_fitness/core/error/failures.dart';
import 'package:devera_fitness/data/responses/heart_rate_response.dart';

import '../responses/activity_response.dart';

import '../../core/error/exceptions.dart';
import '../../core/network/network_info.dart';
import '../remote_services/interfaces/heart_rate_remote_service.dart';
import 'interfaces/heart_rate_repository.dart';

class HeartRateRepository implements IHeartRateRepository {
  final IHeartRateRemoteService remoteService;
  final INetworkInfo networkInfo;

  HeartRateRepository({required this.networkInfo, required this.remoteService});

  @override
  Future<Either<Failure, HeartRateResponse>> getResponse() async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        final remoteData = await remoteService.getResponse();
        return Right(remoteData);
      }
      return Right(HeartRateResponse());
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
