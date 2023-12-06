import 'package:bank_thing/core/domain/entities/credit_calculation.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation/credit_calculation_repository.dart';
import 'package:mobx/mobx.dart';
part 'credic_calculation_list_view_controller.g.dart';

class CreditCalculationListViewController = _CreditCalculationListViewControllerBase
    with _$CreditCalculationListViewController;

abstract class _CreditCalculationListViewControllerBase with Store {
  final CreditCalculationRepository repository;

  ObservableList<CreditCalculation> availableCalculations = ObservableList();

  @observable
  bool isLoading = false;

  ObservableSet<int> deletingCalculationsIds = ObservableSet();

  @action
  Future<void> load() async {
    isLoading = true;
    final fetchedCalculations = await repository.getCreditCalculations();
    if (fetchedCalculations != null) {
      fetchedCalculations.sort(
        (l, r) => -l.createdTime.compareTo(r.createdTime),
      );
      availableCalculations.clear();
      availableCalculations.addAll(fetchedCalculations);
    }
    isLoading = false;
  }

  @action
  Future<void> deleteCalculation(CreditCalculation creditCalculation) async {
    deletingCalculationsIds.add(creditCalculation.id);
    final deleted = await repository.deleteCreditCalculation(creditCalculation);
    if (deleted) {
      availableCalculations.remove(creditCalculation);
    }
    deletingCalculationsIds.remove(creditCalculation.id);
  }

  _CreditCalculationListViewControllerBase({required this.repository});
}
