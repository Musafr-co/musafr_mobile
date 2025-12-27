import 'dart:ui';


String getDeviceCountryCode() {
  return window.locale.countryCode ?? 'QA';
}