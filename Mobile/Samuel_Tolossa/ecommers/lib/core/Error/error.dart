

import 'package:equatable/equatable.dart';

class Failur  extends Equatable{
  final String message;
  const Failur ({
    required this.message
  });


  @override
  List<Object?> get props => [
    message
  ];
}

class ServerFailure extends Failur {
  const ServerFailure ({
    required super.message
  });
}

class ConnectionFailur extends Failur {

  const ConnectionFailur ({
    required super.message
  });

}
class CachException extends Failur {
  const CachException ({
    required super.message
  });
}