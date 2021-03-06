import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';
import 'package:lunasea/modules/tautulli.dart';

class TautulliMoreStatisticsTile extends StatelessWidget {
    @override
    Widget build(BuildContext context) => LSCardTile(
        title: LSTitle(text: 'Statistics'),
        subtitle: LSSubtitle(text: 'User & Library Statistics'),
        trailing: LSIconButton(
            icon: Icons.format_list_numbered,
            color: LunaColours.list(6),
        ),
        onTap: () async => _onTap(context),
    );

    Future<void> _onTap(BuildContext context) async => TautulliStatisticsRouter.navigateTo(context);
}
