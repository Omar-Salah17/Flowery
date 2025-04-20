import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/about_us/data/Models/About_us_model.dart';
import 'package:flowery/features/profile/about_us/domain/repositories/about_us_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AboutUsUseCase{
  AboutRepository aboutRepository;
  AboutUsUseCase(this.aboutRepository);


  Future<Either<Failure,AboutUsModel>> call()async{
    return await aboutRepository.getAboutUsContent();
  }


}