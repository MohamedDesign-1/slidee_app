import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:slidee_app/core/errors/faliures.dart';
import 'package:slidee_app/features/mainlayout_screen/profile_screen/domain/use_cases/get_profile_use_case.dart';

import '../../data/models/fetch_profile_model.dart';

part 'fetchprofile_state.dart';

@injectable
class FetchProfileCubit extends Cubit<FetchprofileState> {
  FetchProfileUseCase fetchProfileUseCase;
  FetchProfileCubit({required this.fetchProfileUseCase}) : super(FetchProfileInitial());

  static var userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> getProfile(String userId) async {
    print("Fetching profile for userId: $userId"); // تتبع بداية عملية الجلب
    emit(FetchProfileLoading());
    final result = await fetchProfileUseCase.execute(userId);
    result.fold(
          (error) {
        print("Error fetching profile: ${error.errorMessage}"); // تتبع الخطأ
        emit(FetchProfileError(error));
      },
          (response) {
        print("Profile fetched successfully: ${response.username}"); // تتبع نجاح الجلب
        emit(FetchProfileLoaded(response));
      },
    );
  }
}
