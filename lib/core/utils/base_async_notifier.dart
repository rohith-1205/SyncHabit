import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'result.dart';

abstract class BaseAsyncNotifier<T> extends AsyncNotifier<T> {
  Future<void> execute(Future<Result<T>> Function() action) async {
    state = const AsyncValue.loading();
    final result = await action();
    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}

abstract class BaseFamilyAsyncNotifier<T, Arg> extends FamilyAsyncNotifier<T, Arg> {
  Future<void> execute(Future<Result<T>> Function() action) async {
    state = const AsyncValue.loading();
    final result = await action();
    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}
