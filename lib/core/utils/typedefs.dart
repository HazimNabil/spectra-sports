import 'package:dartz/dartz.dart';
import 'package:spectra_sports/core/errors/failure.dart';

typedef ApiResult<T> = Future<Either<Failure, T>>;
