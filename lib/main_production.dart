import 'core/config/flavor_config.dart';
import 'main/app.dart';

void main() {
  bootstrap(
    Flavor.production,
    'SyncHabit',
    'com.synchabit.app',
    'https://api.synchabit.ai/v1',
  );
}
