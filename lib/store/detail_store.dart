import 'package:freelance/enums/store_state.dart';
import 'package:freelance/models/details_model.dart';
import 'package:freelance/repository/details_repository.dart';
import 'package:mobx/mobx.dart';

part 'detail_store.g.dart';

class DetailStore = _DetailStore with _$DetailStore;

abstract class _DetailStore with Store {
  final repo = DetailRepository();

  @observable
  ObservableList<DetailModel> details = ObservableList<DetailModel>.of([]);

  @observable
  StoreState state = StoreState.SUCCESS;

  @action
  Future<void> getDetails() async {
    state = StoreState.LOADING;
    final detailsList = await repo.getDetails();
    if (detailsList.isNotEmpty) {
      details
        ..clear()
        ..addAll(detailsList);
    } else {
      state = StoreState.EMPTY;
    }
    state = StoreState.SUCCESS;
  }
}
