abstract class AppError implements Exception{
  final int? errorCode;
  final String message;

  const AppError({required this.message, this.errorCode});

}

class ServerError extends AppError{
  const ServerError({super.errorCode,required  super.message});
}

class NetworkError extends AppError{
  const NetworkError({super.errorCode,required  super.message});
}

class UnauthorizedError extends AppError{
  const UnauthorizedError({super.errorCode = 401,required super.message});
}

class IncorrectDataError extends AppError{
  const IncorrectDataError({super.errorCode,required  super.message});
}

class UndefinedError extends AppError{
  const UndefinedError({super.errorCode,required  super.message});
}