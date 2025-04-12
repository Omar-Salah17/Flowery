
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';

import '../../domain/use_cases/logout_use_case.dart';
import 'logout_states.dart';


@injectable
class LogoutViewModel extends Cubit<LogoutState>{

  LogoutUseCase logoutUseCase;
  LogoutViewModel(this.logoutUseCase) : super(LogoutInitState());


  Future<void> userLogout(String token)async{
    try{
      var result =await logoutUseCase.call(token);
      result.fold(
            (err) {
          emit(LogoutFailureState(err.errorMessage));
        }
        ,
            (message) {
          emit(LogoutSuccessState(message));

        },);
    }catch(e){
      //custom error for jwt malformed when we get the Saved Token we will delete it
      //And Remove it
      emit(LogoutFailureState("Session Expired, Logging out!"));
    }



  }







}