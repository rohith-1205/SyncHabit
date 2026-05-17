# Android Flavor Setup (apply after `fvm flutter create .`)

## File: android/app/build.gradle

Inside the `android { ... }` block, add:

```groovy
flavorDimensions "env"

productFlavors {
    development {
        dimension "env"
        applicationId "com.synchabit.dev"
        resValue "string", "app_name", "SyncHabit Dev"
    }
    staging {
        dimension "env"
        applicationId "com.synchabit.stage"
        resValue "string", "app_name", "SyncHabit Stage"
    }
    production {
        dimension "env"
        applicationId "com.synchabit.app"
        resValue "string", "app_name", "SyncHabit"
    }
}
```

## File: android/app/src/main/AndroidManifest.xml

Change the `android:label` attribute to use the dynamic string:
```xml
android:label="@string/app_name"
```

## Run Commands (after patch)

```bash
# Development on Pixel 9
fvm flutter run --flavor development --target lib/main_development.dart

# Staging
fvm flutter run --flavor staging --target lib/main_staging.dart

# Production Release APK
fvm flutter build apk --flavor production --target lib/main_production.dart --release
```
