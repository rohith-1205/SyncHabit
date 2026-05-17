import 'core/config/flavor_config.dart';
import 'main/app.dart';

void main() {
  bootstrap(
    Flavor.development,
    'SyncHabit Dev',
    'com.synchabit.dev',
    'https://api.dev.synchabit.ai/v1',
  );
}
