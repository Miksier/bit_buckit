part of 'credentials_bloc.dart';

abstract class CredentialsEvent extends Equatable {
  const CredentialsEvent();
}

class ContinueButtonPressed extends CredentialsEvent {
  final String url;
  final String token;
  final Function onSuccess;

  const ContinueButtonPressed({
    this.url,
    this.token,
    this.onSuccess,
  });

  @override
  List<Object> get props => [url, token];

  @override
  String toString() =>
      'LoginButtonPressed { username: $url, password: $token }';
}

class TokenButtonPressed extends CredentialsEvent {
  const TokenButtonPressed();

  @override
  List<Object> get props => [];

  @override
  String toString() =>
      'TokenButtonPressed';
}

class CredentialsButtonPressed extends CredentialsEvent {
  const CredentialsButtonPressed();

  @override
  List<Object> get props => [];

  @override
  String toString() =>
      'CredentialsButtonPressed';
}