import 'package:card_settings/common/base/base_cubit.dart';
import 'package:card_settings/presentation/home/cubit/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends BaseCubit<HomeBuildable, HomeListenable> {
  HomeCubit() : super(const HomeBuildable());
}