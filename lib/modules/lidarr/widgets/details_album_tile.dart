import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';
import 'package:lunasea/modules/lidarr.dart';

class LidarrDetailsAlbumTile extends StatefulWidget {
    final LidarrAlbumData data;
    final Function refreshState;

    LidarrDetailsAlbumTile({
        Key key,
        @required this.data,
        @required this.refreshState,
    }) : super(key: key);

    @override
    State<LidarrDetailsAlbumTile> createState() => _State();
}

class _State extends State<LidarrDetailsAlbumTile> {
    final double _imageDimension = 70.0;

    @override
    Widget build(BuildContext context) => LSCard(
        child: InkWell(
            borderRadius: BorderRadius.circular(Constants.UI_BORDER_RADIUS),
            child: Row(
                children: <Widget>[
                    widget.data.albumCoverURI() != null && widget.data.albumCoverURI() != ''
                        ? LSNetworkImage(
                            url: widget.data.albumCoverURI(),
                            placeholder: 'assets/images/lidarr/noalbumart.png',
                            headers: ((Database.currentProfileObject.getLidarr()['headers'] ?? {}) as Map).cast<String, String>(),
                            height: _imageDimension,
                            width: _imageDimension,
                        )
                        : Container(),
                    Expanded(
                        child: Padding(
                            child: Column(
                                children: <Widget>[
                                    LSTitle(text: widget.data.title, darken: !widget.data.monitored),
                                    RichText(
                                        text: TextSpan(
                                            text: "${widget.data.tracks}",
                                            style: TextStyle(
                                                color: widget.data.monitored ? Colors.white70 : Colors.white30,
                                                fontSize: Constants.UI_FONT_SIZE_SUBTITLE,
                                            ),
                                            children: <TextSpan> [
                                                TextSpan(
                                                    text: '\n${widget.data.releaseDateString}',
                                                    style: TextStyle(
                                                        color: widget.data.monitored ? LunaColours.accent : LunaColours.accent.withOpacity(0.30),
                                                        fontWeight: FontWeight.bold,
                                                    ),
                                                ),
                                            ],
                                        ),
                                    ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                    ),
                    Padding(
                        child: LSIconButton(
                            icon: widget.data.monitored ? 
                                Icons.turned_in :
                                Icons.turned_in_not,
                            color: widget.data.monitored ?
                                Colors.white :
                                Colors.white30,
                            onPressed: () => _toggleMonitoredStatus(),
                        ),
                        padding: EdgeInsets.fromLTRB(8.0, 0.0, 12.0, 0.0),
                    ),
                ],
            ),
            
            onTap: () async => _enterAlbum(),
        ),
    );

    Future<void> _toggleMonitoredStatus() async {
        LidarrAPI _api = LidarrAPI.from(Database.currentProfileObject);
        await _api.toggleAlbumMonitored(widget.data.albumID, !widget.data.monitored)
        .then((_) {
            if(mounted) setState(() => widget.data.monitored = !widget.data.monitored);
            widget.refreshState();
            LSSnackBar(context: context, title: widget.data.monitored ? 'Monitoring' : 'No Longer Monitoring', message: widget.data.title, type: SNACKBAR_TYPE.success);
        })
        .catchError((_) => LSSnackBar(context: context, title: widget.data.monitored ? 'Failed to Stop Monitoring' : 'Failed to Monitor', message: LunaLogger.CHECK_LOGS_MESSAGE, type: SNACKBAR_TYPE.failure));
    }

    Future<void> _enterAlbum() async => await Navigator.of(context).pushNamed(
        LidarrDetailsAlbum.ROUTE_NAME,
        arguments: LidarrDetailsAlbumArguments(
            albumID: widget.data.albumID,
            title: widget.data.title,
            monitored: widget.data.monitored,
        ),
    );
}
