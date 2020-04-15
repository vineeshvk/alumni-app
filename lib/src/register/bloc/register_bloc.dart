import 'dart:async';

import 'package:alumni_app/src/authentication-bloc/authentication-bloc.dart';
import 'package:alumni_app/src/authentication-bloc/authentication_event.dart';
import 'package:alumni_app/src/authentication-bloc/user-repository.dart';
import 'package:alumni_app/src/register/bloc/register_event.dart';
import 'package:alumni_app/src/register/bloc/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  RegisterBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();

      try {
        final data = await userRepository.register(
          name: event.name,
          email: event.email,
          password: event.password,
        );

        if (data["error"] == null) {
          authenticationBloc.add(LoggedIn(data: data["token"]));
          yield RegisterInitial();
        } else
          yield RegisterFailure(error: data["error"]);
      } catch (error) {
        yield RegisterFailure(error: error.toString());
      }
    }
  }
}
