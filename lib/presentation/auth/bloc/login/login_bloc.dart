import 'package:bloc/bloc.dart';
import 'package:canary_farm/data/models/request/auth/login_request_model.dart';
import 'package:canary_farm/data/models/response/auth/auth_response_model.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
