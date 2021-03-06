import 'package:flutter/material.dart';
import 'package:tautulli/tautulli.dart';
import 'package:lunasea/core.dart';
import 'package:lunasea/modules/tautulli.dart';

class TautulliMediaDetailsMetadataHeaderTile extends StatelessWidget {
    final TautulliMetadata metadata;
    final double _height = 105.0;
    final double _width = 70.0;
    final double _padding = 8.0;

    TautulliMediaDetailsMetadataHeaderTile({
        Key key,
        @required this.metadata,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) => LSCard(
        child: _body(context),
        decoration: metadata.art != null && metadata.art.isNotEmpty
            ? LunaCardDecoration(
                uri: context.watch<TautulliState>().getImageURLFromPath(
                    metadata.art,
                    width: MediaQuery.of(context).size.width.truncate(),
                ),
                headers: context.watch<TautulliState>().headers,
            )
            : null,
    );

    Widget _body(BuildContext context) => Row(
        children: [
            _poster(context),
            Expanded(child: _mediaInfo),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
    );

    String get _posterLink {
        switch(metadata.mediaType) {
            case TautulliMediaType.MOVIE:
            case TautulliMediaType.SHOW:
            case TautulliMediaType.SEASON:
            case TautulliMediaType.ARTIST:
            case TautulliMediaType.ALBUM:
            case TautulliMediaType.LIVE:
            case TautulliMediaType.COLLECTION: return metadata.thumb;
            case TautulliMediaType.EPISODE: return metadata.grandparentThumb;
            case TautulliMediaType.TRACK: return metadata.parentThumb;
            case TautulliMediaType.NULL:
            default: return '';
        }
    }

    Widget _poster(BuildContext context) {
        return LSNetworkImage(
            url: context.watch<TautulliState>().getImageURLFromPath(_posterLink),
            placeholder: 'assets/images/sonarr/noseriesposter.png',
            height: _height,
            width: _width,
            headers: context.watch<TautulliState>().headers.cast<String, String>(),
        );
    }

    Widget get _mediaInfo => Padding(
        child: Container(
            child: Column(
                children: [
                    LSTitle(text: _title, maxLines: 1),
                    SizedBox(height: 4.0),
                    ..._subtitles,
                ],
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
            ),
            height: (_height-(_padding*2)),
        ),
        padding: EdgeInsets.all(_padding),
    );

    String get _title => metadata.grandparentTitle == null || metadata.grandparentTitle.isEmpty
        ? metadata.parentTitle == null || metadata.parentTitle.isEmpty
        ? metadata.title == null || metadata.title.isEmpty
        ? 'Unknown Title'
        : metadata.title
        : metadata.parentTitle
        : metadata.grandparentTitle;

    List<Widget> get _subtitles {
        switch(metadata.mediaType) {   
            case TautulliMediaType.MOVIE:
            case TautulliMediaType.SHOW: 
            case TautulliMediaType.ALBUM:
            case TautulliMediaType.SEASON: return [_subtitleOne];
            case TautulliMediaType.EPISODE:
            case TautulliMediaType.TRACK: return [_subtitleOne, _subtitleTwo];
            case TautulliMediaType.ARTIST:
            case TautulliMediaType.COLLECTION:
            case TautulliMediaType.LIVE:
            case TautulliMediaType.NULL:
            default: return [];
        }
    }

    Widget get _subtitleOne {
        String _text = '';
        switch(metadata.mediaType) {   
            case TautulliMediaType.MOVIE:
            case TautulliMediaType.ARTIST:
            case TautulliMediaType.SHOW: _text = metadata.year?.toString() ?? 'Unknown'; break;
            case TautulliMediaType.ALBUM:
            case TautulliMediaType.SEASON:
            case TautulliMediaType.LIVE:
            case TautulliMediaType.COLLECTION: _text = metadata.title; break;
            case TautulliMediaType.EPISODE: _text = '${metadata.parentTitle} ${Constants.TEXT_BULLET} Episode ${metadata.mediaIndex}'; break;
            case TautulliMediaType.TRACK: _text = '${metadata.parentTitle} ${Constants.TEXT_BULLET} Track ${metadata.mediaIndex}'; break;
            case TautulliMediaType.NULL:
            default: _text = 'Unknown'; break;
        }
        return LSSubtitle(text: _text);
    }

    Widget get _subtitleTwo {
        String _text = '';
        switch(metadata.mediaType) {   
            case TautulliMediaType.MOVIE:
            case TautulliMediaType.ARTIST:
            case TautulliMediaType.SHOW: _text = metadata.year?.toString() ?? 'Unknown'; break;
            case TautulliMediaType.ALBUM:
            case TautulliMediaType.SEASON:
            case TautulliMediaType.LIVE:
            case TautulliMediaType.COLLECTION:
            case TautulliMediaType.EPISODE:
            case TautulliMediaType.TRACK: _text = metadata.title; break;
            case TautulliMediaType.NULL:
            default: _text = 'Unknown'; break;
        }
        return Text(
            _text,
            maxLines: 3,
            style: TextStyle(
                color: Colors.white70,
                fontSize: Constants.UI_FONT_SIZE_SUBTITLE,
            ),
        );
    }
}
