import 'package:flowery/features/home/data/models/occaions.dart';

abstract class OccasionRemoteDataSourceContract {
  Future< List<Occasions>> getAllOccasions();
}