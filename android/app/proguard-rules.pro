# Supresión de advertencias relacionadas con Google Play Services Auth
-dontwarn com.google.android.gms.auth.api.credentials.Credential
-dontwarn com.google.android.gms.auth.api.credentials.CredentialsApi
-dontwarn com.google.android.gms.auth.api.credentials.HintRequest$Builder
-dontwarn com.google.android.gms.auth.api.credentials.HintRequest

# Mantén todas las clases necesarias para Google Play Services Auth
-keep class com.google.android.gms.** { *; }

# Opcional: Anotaciones para evitar que R8 elimine clases necesarias
-keep class proguard.annotation.Keep { *; }
-keepclassmembers class proguard.annotation.KeepClassMembers { *; }
-keep class com.shivam.otp_pin_field.** { *; }