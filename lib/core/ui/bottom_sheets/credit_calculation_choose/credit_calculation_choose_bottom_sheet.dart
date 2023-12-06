import 'package:bank_thing/app_localizations.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation/credit_calculation_repository.dart';
import 'package:bank_thing/core/ui/bottom_sheets/credit_calculation_choose/credit_calculation_choose_item.dart';
import 'package:bank_thing/core/ui/hooks/effect_once.dart';
import 'package:bank_thing/core/ui/state_managment/credic_calculation_list_view_controller/credic_calculation_list_view_controller.dart';
import 'package:bank_thing/core/ui/values/core_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

Future<CreditCalculation?> showCreditCalculationChooseBottomSheet(
  BuildContext context,
) {
  return showModalBottomSheet<CreditCalculation>(
    context: context,
    builder: (context) => CreditCalculationChooseBottomSheet(),
  );
}

class CreditCalculationChooseBottomSheet extends HookWidget {
  const CreditCalculationChooseBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(
      () => CreditCalculationListViewController(
        repository: GetIt.I<CreditCalculationRepository>(),
      ),
    );
    useEffectOnce(() async {
      controller.load();
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 24,
        ),
        Observer(builder: (context) {
          if (controller.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (controller.availableCalculations.isEmpty)
            return Center(
              child: Text(
                AppLocalizations.of(context).fetchEmptyError,
                style: CoreTextStyles.fetchEmptyError,
              ),
            );
          else
            return Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = controller.availableCalculations[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Observer(builder: (context) {
                      final isBeingDeleted =
                          controller.deletingCalculationsIds.contains(item.id);
                      return CreditCalculationChooseItem(
                        creditCalculation: item,
                        onBodyTap: () {
                          Navigator.of(context).pop(item);
                        },
                        onRemoveTap: () async {
                          controller.deleteCalculation(item);
                        },
                        isBeingDeleted: isBeingDeleted,
                      );
                    }),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                itemCount: controller.availableCalculations.length,
              ),
            );
        }),
      ],
    );
  }
}
