// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailStore on _DetailStore, Store {
  final _$detailsAtom = Atom(name: '_DetailStore.details');

  @override
  ObservableList<DetailModel> get details {
    _$detailsAtom.reportRead();
    return super.details;
  }

  @override
  set details(ObservableList<DetailModel> value) {
    _$detailsAtom.reportWrite(value, super.details, () {
      super.details = value;
    });
  }

  final _$stateAtom = Atom(name: '_DetailStore.state');

  @override
  StoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$getDetailsAsyncAction = AsyncAction('_DetailStore.getDetails');

  @override
  Future<void> getDetails() {
    return _$getDetailsAsyncAction.run(() => super.getDetails());
  }

  @override
  String toString() {
    return '''
details: ${details},
state: ${state}
    ''';
  }
}
