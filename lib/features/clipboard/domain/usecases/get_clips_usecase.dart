import 'package:cliply_app/core/error/failure.dart';
import 'package:cliply_app/core/usecases/usecase.dart';
import 'package:cliply_app/features/clipboard/domain/entity/clip.dart';
import 'package:cliply_app/features/clipboard/domain/repositories/clipboard_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetClips implements UseCaseWithoutParams<List<Clip>> {
  final ClipboardRepository repository;

  GetClips(this.repository);

  @override
  Future<Either<Failure, List<Clip>>> call() async {
    return await repository.getClips();
  }
}
