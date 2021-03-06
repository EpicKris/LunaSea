import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';

class SearchConstants {
    SearchConstants._();

    static const String MODULE_KEY = 'search';

    static const LunaModuleMetadata MODULE_METADATA = LunaModuleMetadata(
        name: 'Search',
        description: 'Search Newznab Indexers',
        settingsDescription: 'Configure Search',
        helpMessage: '${Constants.APPLICATION_NAME} currently supports all indexers that support the newznab protocol, including NZBHydra2.',
        icon: Icons.search,
        route: '/search',
        color: Color(LunaColours.ACCENT_COLOR),
        website: '',
        github: 'https://github.com/theotherp/nzbhydra2',
    );

    //ignore: non_constant_identifier_names
    static final ShortcutItem MODULE_QUICK_ACTION = ShortcutItem(
        type: MODULE_KEY,
        localizedTitle: MODULE_METADATA.name,
    );

    static const List<String> ADULT_CATEGORIES = ['xxx', 'adult', 'porn'];
}
