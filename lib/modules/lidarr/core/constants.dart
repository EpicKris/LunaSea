import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';

class LidarrConstants {
    LidarrConstants._();

    static const MODULE_KEY = 'lidarr';

    static const LunaModuleMetadata MODULE_METADATA = LunaModuleMetadata(
        name: 'Lidarr',
        description: 'Manage Music',
        settingsDescription: 'Configure Lidarr',
        helpMessage: 'Lidarr is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new tracks from your favorite artists and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.',
        icon: CustomIcons.music,
        route: '/lidarr',
        color: Color(0xFF159552),
        website: 'https://lidarr.audio',
        github: 'https://github.com/Lidarr/Lidarr',
    );

    static const Map EVENT_TYPE_MESSAGES = {
        'trackFileRenamed': 'Track File Renamed',
        'trackFileDeleted': 'Track File Deleted',
        'trackFileImported': 'Track File Imported',
        'albumImportIncomplete': 'Album Import Incomplete',
        'downloadImported': 'Download Imported',
        'downloadFailed': 'Download Failed',
        'grabbed': 'Grabbed From',
    };

    //ignore: non_constant_identifier_names
    static final ShortcutItem MODULE_QUICK_ACTION = ShortcutItem(
        type: MODULE_KEY,
        localizedTitle: MODULE_METADATA.name,
    );
}