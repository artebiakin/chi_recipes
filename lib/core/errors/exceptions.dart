import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  const ServerException({
    required this.code,
    required this.message,
  });

  final int code;
  final String message;

  @override
  List<Object> get props => [];
}

class CacheException implements Exception {}
