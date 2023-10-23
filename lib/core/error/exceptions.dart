import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class ServerException extends Failure implements Exception {
  const ServerException({
    this.arrayMessage,
    this.stringMessage,
  });

  final List<String>? arrayMessage;
  final String? stringMessage;

  @override
  List<Object?> get props => [arrayMessage];
}

class NoDataException extends Failure implements Exception {
  @override
  List<Object?> get props => [''];
}

class CacheException extends Failure implements Exception {
  @override
  List<Object?> get props => [''];
}
