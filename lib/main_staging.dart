import 'core/config/flavor_config.dart';
import 'main/app.dart';

void main() {
  bootstrap(
    Flavor.staging,
    'SyncHabit Stage',
    'com.synchabit.stage',
    'https://api.staging.synchabit.ai/v1',
  );
}
