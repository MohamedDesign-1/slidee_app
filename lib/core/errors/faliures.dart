class Faliures {
  final String errorMessage;
  Faliures({required this.errorMessage});
}

class ServerFaliure extends Faliures {
  ServerFaliure({required String errorMessage}) : super(errorMessage: errorMessage);
}

class NetworkFaliure extends Faliures {
  NetworkFaliure({required String errorMessage}) : super(errorMessage: errorMessage);
}