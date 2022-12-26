// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_listmain_screen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoreListMain on _StoreListMain, Store {
  late final _$loadingAtom =
      Atom(name: '_StoreListMain.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$listWorkDaysAtom =
      Atom(name: '_StoreListMain.listWorkDays', context: context);

  @override
  ObservableList<WorkDay> get listWorkDays {
    _$listWorkDaysAtom.reportRead();
    return super.listWorkDays;
  }

  @override
  set listWorkDays(ObservableList<WorkDay> value) {
    _$listWorkDaysAtom.reportWrite(value, super.listWorkDays, () {
      super.listWorkDays = value;
    });
  }

  @override
  String toString() {
    return '''
loading: ${loading},
listWorkDays: ${listWorkDays}
    ''';
  }
}
