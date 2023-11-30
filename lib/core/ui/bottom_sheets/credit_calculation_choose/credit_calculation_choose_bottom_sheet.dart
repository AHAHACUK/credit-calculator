import 'package:bank_thing/app_localizations.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation_repository.dart';
import 'package:bank_thing/core/ui/bottom_sheets/credit_calculation_choose/credit_calculation_choose_item.dart';
import 'package:bank_thing/core/ui/hooks/effect_once.dart';
import 'package:bank_thing/core/ui/values/core_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final availableCalculations = useState<List<CreditCalculation>?>(null);
    final isLoading = useState(true);
    final repository = useMemoized(
      () => GetIt.I<CreditCalculationRepository>(),
    );
    useEffectOnce(() async {
      final fetchedCalculations = await repository.getCreditCalculations();
      fetchedCalculations?.sort(
        (l, r) => -l.createdTime.compareTo(r.createdTime),
      );
      availableCalculations.value = fetchedCalculations;
      isLoading.value = false;
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 24,
        ),
        if (isLoading.value)
          Center(
            child: CircularProgressIndicator(),
          )
        else if (availableCalculations.value != null &&
            availableCalculations.value!.isEmpty)
          Center(
            child: Text(
              AppLocalizations.of(context).fetchEmptyError,
              style: CoreTextStyles.fetchEmptyError,
            ),
          )
        else if (availableCalculations.value != null)
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = availableCalculations.value![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: CreditCalculationChooseItem(
                    creditCalculation: item,
                    onTap: () {
                      Navigator.of(context).pop(item);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemCount: availableCalculations.value!.length,
            ),
          )
        else
          Center(
            child: Text(
              AppLocalizations.of(context).fetchError,
              style: CoreTextStyles.fetchError,
            ),
          )
      ],
    );
  }
}
