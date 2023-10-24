import 'package:dartz/dartz.dart';

import '/src/core/errors/failure.dart';
import '/src/core/usecases/base_usecase.dart';
import '/src/features/favorite/domain/entities/fav_params.dart';
import '/src/features/favorite/domain/repositories/favorite_repo.dart';

class AddToFavUseCase implements BaseUseCases<dynamic, FavParams> {
  final FavoriteRepo favoriteRepo;

  const AddToFavUseCase({required this.favoriteRepo});

  @override
  Future<Either<Failure, dynamic>> call(FavParams params) async {
    return await favoriteRepo.addToFav(
      uId: params.uId,
      hotelId: params.hotelId,
    );
  }
}
