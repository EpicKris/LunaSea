import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';

class LunaDatabase extends LunaModuleDatabase {
    @override
    void registerAdapters() {
        Hive.registerAdapter(LunaBrowserAdapter());
    }

    @override
    Map<String, dynamic> export() {
        Map<String, dynamic> data = {};
        for(LunaDatabaseValue value in LunaDatabaseValue.values) {
            switch(value) {
                // Non-primitive values
                case LunaDatabaseValue.SELECTED_BROWSER: data[value.key] = (LunaDatabaseValue.SELECTED_BROWSER.data as LunaBrowser).key; break;
                // Primitive values
                case LunaDatabaseValue.ENABLED_PROFILE: 
                case LunaDatabaseValue.ENABLED_SENTRY:
                case LunaDatabaseValue.THEME_AMOLED:
                case LunaDatabaseValue.THEME_AMOLED_BORDER:
                case LunaDatabaseValue.THEME_IMAGE_BACKGROUND_OPACITY:
                case LunaDatabaseValue.DRAWER_GROUP_MODULES:
                case LunaDatabaseValue.DRAWER_EXPAND_AUTOMATION:
                case LunaDatabaseValue.DRAWER_EXPAND_CLIENTS:
                case LunaDatabaseValue.DRAWER_EXPAND_MONITORING:
                case LunaDatabaseValue.QUICK_ACTIONS_LIDARR:
                case LunaDatabaseValue.QUICK_ACTIONS_RADARR:
                case LunaDatabaseValue.QUICK_ACTIONS_SONARR:
                case LunaDatabaseValue.QUICK_ACTIONS_NZBGET:
                case LunaDatabaseValue.QUICK_ACTIONS_SABNZBD:
                case LunaDatabaseValue.QUICK_ACTIONS_TAUTULLI:
                case LunaDatabaseValue.QUICK_ACTIONS_SEARCH:
                case LunaDatabaseValue.USE_24_HOUR_TIME:
                case LunaDatabaseValue.LATEST_CHANGELOG_BUILD_SHOWN: data[value.key] = value.data; break;
            }
        }
        return data;
    }

    @override
    void import(Map<String, dynamic> config) {
        for(String key in config.keys) {
            LunaDatabaseValue value = valueFromKey(key);
            if(value != null) switch(value) {
                // Non-primitive values
                case LunaDatabaseValue.SELECTED_BROWSER: value.put(LunaBrowser.APPLE_SAFARI.fromKey(config[key])); break;
                // Primitive values
                case LunaDatabaseValue.ENABLED_PROFILE: 
                case LunaDatabaseValue.ENABLED_SENTRY:
                case LunaDatabaseValue.THEME_AMOLED:
                case LunaDatabaseValue.THEME_AMOLED_BORDER:
                case LunaDatabaseValue.THEME_IMAGE_BACKGROUND_OPACITY:
                case LunaDatabaseValue.DRAWER_GROUP_MODULES:
                case LunaDatabaseValue.DRAWER_EXPAND_AUTOMATION:
                case LunaDatabaseValue.DRAWER_EXPAND_CLIENTS:
                case LunaDatabaseValue.DRAWER_EXPAND_MONITORING:
                case LunaDatabaseValue.QUICK_ACTIONS_LIDARR:
                case LunaDatabaseValue.QUICK_ACTIONS_RADARR:
                case LunaDatabaseValue.QUICK_ACTIONS_SONARR:
                case LunaDatabaseValue.QUICK_ACTIONS_NZBGET:
                case LunaDatabaseValue.QUICK_ACTIONS_SABNZBD:
                case LunaDatabaseValue.QUICK_ACTIONS_TAUTULLI:
                case LunaDatabaseValue.QUICK_ACTIONS_SEARCH:
                case LunaDatabaseValue.USE_24_HOUR_TIME:
                case LunaDatabaseValue.LATEST_CHANGELOG_BUILD_SHOWN: value.put(config[key]); break;
            }
        }
    }

    LunaDatabaseValue valueFromKey(String key) {
        switch(key) {
            case 'profile': return LunaDatabaseValue.ENABLED_PROFILE;
            case 'LUNASEA_ENABLED_SENTRY': return LunaDatabaseValue.ENABLED_SENTRY;
            case 'LUNASEA_THEME_AMOLED': return LunaDatabaseValue.THEME_AMOLED;
            case 'LUNASEA_THEME_AMOLED_BORDER': return LunaDatabaseValue.THEME_AMOLED_BORDER;
            case 'LUNASEA_THEME_IMAGE_BACKGROUND_OPACITY': return LunaDatabaseValue.THEME_IMAGE_BACKGROUND_OPACITY;
            case 'LUNASEA_SELECTED_BROWSER': return LunaDatabaseValue.SELECTED_BROWSER;
            case 'LUNASEA_DRAWER_GROUP_MODULES': return LunaDatabaseValue.DRAWER_GROUP_MODULES;
            case 'LUNASEA_DRAWER_EXPAND_AUTOMATION': return LunaDatabaseValue.DRAWER_EXPAND_AUTOMATION;
            case 'LUNASEA_DRAWER_EXPAND_CLIENTS': return LunaDatabaseValue.DRAWER_EXPAND_CLIENTS;
            case 'LUNASEA_DRAWER_EXPAND_MONITORING': return LunaDatabaseValue.DRAWER_EXPAND_MONITORING;
            case 'LUNASEA_QUICK_ACTIONS_LIDARR': return LunaDatabaseValue.QUICK_ACTIONS_LIDARR;
            case 'LUNASEA_QUICK_ACTIONS_RADARR': return LunaDatabaseValue.QUICK_ACTIONS_RADARR;
            case 'LUNASEA_QUICK_ACTIONS_SONARR': return LunaDatabaseValue.QUICK_ACTIONS_SONARR;
            case 'LUNASEA_QUICK_ACTIONS_NZBGET': return LunaDatabaseValue.QUICK_ACTIONS_NZBGET;
            case 'LUNASEA_QUICK_ACTIONS_SABNZBD': return LunaDatabaseValue.QUICK_ACTIONS_SABNZBD;
            case 'LUNASEA_QUICK_ACTIONS_TAUTULLI': return LunaDatabaseValue.QUICK_ACTIONS_TAUTULLI;
            case 'LUNASEA_QUICK_ACTIONS_SEARCH': return LunaDatabaseValue.QUICK_ACTIONS_SEARCH;
            case 'LUNASEA_USE_24_HOUR_TIME': return LunaDatabaseValue.USE_24_HOUR_TIME;
            case 'LUNASEA_LATEST_CHANGELOG_BUILD_SHOWN': return LunaDatabaseValue.LATEST_CHANGELOG_BUILD_SHOWN;
            default: return null;
        }
    }
}

enum LunaDatabaseValue {
    ENABLED_PROFILE,
    ENABLED_SENTRY,
    THEME_AMOLED,
    THEME_AMOLED_BORDER,
    THEME_IMAGE_BACKGROUND_OPACITY,
    SELECTED_BROWSER,
    DRAWER_GROUP_MODULES,
    DRAWER_EXPAND_AUTOMATION,
    DRAWER_EXPAND_CLIENTS,
    DRAWER_EXPAND_MONITORING,
    QUICK_ACTIONS_LIDARR,
    QUICK_ACTIONS_RADARR,
    QUICK_ACTIONS_SONARR,
    QUICK_ACTIONS_NZBGET,
    QUICK_ACTIONS_SABNZBD,
    QUICK_ACTIONS_TAUTULLI,
    QUICK_ACTIONS_SEARCH,
    USE_24_HOUR_TIME,
    LATEST_CHANGELOG_BUILD_SHOWN,
}

extension LunaDatabaseValueExtension on LunaDatabaseValue {
    String get key {
        switch(this) {
            case LunaDatabaseValue.ENABLED_PROFILE: return 'profile';
            case LunaDatabaseValue.ENABLED_SENTRY: return 'LUNASEA_ENABLED_SENTRY';
            case LunaDatabaseValue.THEME_AMOLED: return 'LUNASEA_THEME_AMOLED';
            case LunaDatabaseValue.THEME_AMOLED_BORDER: return 'LUNASEA_THEME_AMOLED_BORDER';
            case LunaDatabaseValue.THEME_IMAGE_BACKGROUND_OPACITY: return 'LUNASEA_THEME_IMAGE_BACKGROUND_OPACITY';
            case LunaDatabaseValue.SELECTED_BROWSER: return 'LUNASEA_SELECTED_BROWSER';
            case LunaDatabaseValue.DRAWER_GROUP_MODULES: return 'LUNASEA_DRAWER_GROUP_MODULES';
            case LunaDatabaseValue.DRAWER_EXPAND_AUTOMATION: return 'LUNASEA_DRAWER_EXPAND_AUTOMATION';
            case LunaDatabaseValue.DRAWER_EXPAND_CLIENTS: return 'LUNASEA_DRAWER_EXPAND_CLIENTS';
            case LunaDatabaseValue.DRAWER_EXPAND_MONITORING: return 'LUNASEA_DRAWER_EXPAND_MONITORING';
            case LunaDatabaseValue.QUICK_ACTIONS_LIDARR: return 'LUNASEA_QUICK_ACTIONS_LIDARR';
            case LunaDatabaseValue.QUICK_ACTIONS_RADARR: return 'LUNASEA_QUICK_ACTIONS_RADARR';
            case LunaDatabaseValue.QUICK_ACTIONS_SONARR: return 'LUNASEA_QUICK_ACTIONS_SONARR';
            case LunaDatabaseValue.QUICK_ACTIONS_NZBGET: return 'LUNASEA_QUICK_ACTIONS_NZBGET';
            case LunaDatabaseValue.QUICK_ACTIONS_SABNZBD: return 'LUNASEA_QUICK_ACTIONS_SABNZBD';
            case LunaDatabaseValue.QUICK_ACTIONS_TAUTULLI: return 'LUNASEA_QUICK_ACTIONS_TAUTULLI';
            case LunaDatabaseValue.QUICK_ACTIONS_SEARCH: return 'LUNASEA_QUICK_ACTIONS_SEARCH';
            case LunaDatabaseValue.USE_24_HOUR_TIME: return 'LUNASEA_USE_24_HOUR_TIME';
            case LunaDatabaseValue.LATEST_CHANGELOG_BUILD_SHOWN: return 'LUNASEA_LATEST_CHANGELOG_BUILD_SHOWN';
        }
        throw Exception('key not found'); 
    }

    dynamic get data {
        final box = Database.lunaSeaBox;
        switch(this) {
            case LunaDatabaseValue.ENABLED_PROFILE: return box.get(this.key, defaultValue: 'default');
            case LunaDatabaseValue.SELECTED_BROWSER: return box.get(this.key, defaultValue: LunaBrowser.APPLE_SAFARI);
            case LunaDatabaseValue.THEME_AMOLED: return box.get(this.key, defaultValue: false);
            case LunaDatabaseValue.THEME_AMOLED_BORDER: return box.get(this.key, defaultValue: false);
            case LunaDatabaseValue.THEME_IMAGE_BACKGROUND_OPACITY: return box.get(this.key, defaultValue: 10);
            case LunaDatabaseValue.ENABLED_SENTRY: return box.get(this.key, defaultValue: true);
            case LunaDatabaseValue.DRAWER_GROUP_MODULES: return box.get(this.key, defaultValue: false);
            case LunaDatabaseValue.DRAWER_EXPAND_AUTOMATION: return box.get(this.key, defaultValue: true);
            case LunaDatabaseValue.DRAWER_EXPAND_CLIENTS: return box.get(this.key, defaultValue: true);
            case LunaDatabaseValue.DRAWER_EXPAND_MONITORING: return box.get(this.key, defaultValue: true);
            case LunaDatabaseValue.QUICK_ACTIONS_LIDARR: return box.get(this.key, defaultValue: false);
            case LunaDatabaseValue.QUICK_ACTIONS_RADARR: return box.get(this.key, defaultValue: false);
            case LunaDatabaseValue.QUICK_ACTIONS_SONARR: return box.get(this.key, defaultValue: false);
            case LunaDatabaseValue.QUICK_ACTIONS_NZBGET: return box.get(this.key, defaultValue: false);
            case LunaDatabaseValue.QUICK_ACTIONS_SABNZBD: return box.get(this.key, defaultValue: false);
            case LunaDatabaseValue.QUICK_ACTIONS_TAUTULLI: return box.get(this.key, defaultValue: false);
            case LunaDatabaseValue.QUICK_ACTIONS_SEARCH: return box.get(this.key, defaultValue: false);
            case LunaDatabaseValue.USE_24_HOUR_TIME: return box.get(this.key, defaultValue: false);
            case LunaDatabaseValue.LATEST_CHANGELOG_BUILD_SHOWN: return box.get(this.key, defaultValue: null);
        }
        throw Exception('data not found'); 
    }

    void put(dynamic value) {
        final box = Database.lunaSeaBox;
        switch(this) {
            case LunaDatabaseValue.ENABLED_PROFILE: if(value.runtimeType == String) box.put(this.key, value); return;
            case LunaDatabaseValue.ENABLED_SENTRY: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.THEME_AMOLED: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.THEME_AMOLED_BORDER: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.THEME_IMAGE_BACKGROUND_OPACITY: if(value.runtimeType == int) box.put(this.key, value); return;
            case LunaDatabaseValue.SELECTED_BROWSER: if(value.runtimeType == LunaBrowser) box.put(this.key, value); return;
            case LunaDatabaseValue.DRAWER_GROUP_MODULES: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.DRAWER_EXPAND_AUTOMATION: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.DRAWER_EXPAND_CLIENTS: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.DRAWER_EXPAND_MONITORING: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.QUICK_ACTIONS_LIDARR: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.QUICK_ACTIONS_RADARR: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.QUICK_ACTIONS_SONARR: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.QUICK_ACTIONS_NZBGET: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.QUICK_ACTIONS_SABNZBD: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.QUICK_ACTIONS_TAUTULLI: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.QUICK_ACTIONS_SEARCH: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.USE_24_HOUR_TIME: if(value.runtimeType == bool) box.put(this.key, value); return;
            case LunaDatabaseValue.LATEST_CHANGELOG_BUILD_SHOWN: if(value.runtimeType == String) box.put(this.key, value); return;
        }
        LunaLogger().warning('LunaDatabaseValueExtension', 'put', 'Attempted to enter data for invalid LunaDatabaseValue: ${this?.toString() ?? 'null'}');
    }

    void listen(Widget Function(BuildContext, Box<dynamic>, Widget) builder) =>  ValueListenableBuilder(
        valueListenable: Database.lunaSeaBox.listenable(keys: [this.key]),
        builder: builder,
    );
}
