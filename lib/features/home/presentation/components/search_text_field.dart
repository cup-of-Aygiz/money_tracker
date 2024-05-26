import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_state.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/di/service_locator.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/uikit/text_field/app_text_filed.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MoneyTrackerStore, MoneyTrackerState>(
      listener: (BuildContext context, state) {
        if (state.filterEntity.searchQuery == null) {
          _searchController.clear();
        }
      },
      child: AppTextField(
        controller: _searchController,
        labelText: context.locale.search,
        border: InputBorder.none,
        onChanged: (query) {
          locator.get<MoneyTrackerStore>().searchTransactionFilter(query);
        },
        suffix: const Icon(Icons.search),
      ),
    );
  }
}
