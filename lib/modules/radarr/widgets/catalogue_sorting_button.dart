import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';
import 'package:lunasea/modules/radarr.dart';

class RadarrCatalogueSortButton extends StatefulWidget {
    final ScrollController controller;

    RadarrCatalogueSortButton({
        Key key,
        @required this.controller,
    }): super(key: key);

    @override
    State<RadarrCatalogueSortButton> createState() => _State();
}

class _State extends State<RadarrCatalogueSortButton> {    
    @override
    Widget build(BuildContext context) => LSCard(
        child: Consumer<RadarrState>(
            builder: (context, model, widget) => PopupMenuButton<RadarrCatalogueSorting>(
                shape: LunaDatabaseValue.THEME_AMOLED.data && LunaDatabaseValue.THEME_AMOLED_BORDER.data
                    ? LSRoundedShapeWithBorder()
                    : LSRoundedShape(),
                icon: LSIcon(icon: Icons.sort),
                onSelected: (result) {
                    if(model.sortCatalogueType == result) {
                        model.sortCatalogueAscending = !model.sortCatalogueAscending;
                    } else {
                        model.sortCatalogueAscending = true;
                        model.sortCatalogueType = result;
                    }
                    _scrollBack();
                },
                itemBuilder: (context) => List<PopupMenuEntry<RadarrCatalogueSorting>>.generate(
                    RadarrCatalogueSorting.values.length,
                    (index) => PopupMenuItem<RadarrCatalogueSorting>(
                        value: RadarrCatalogueSorting.values[index],
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Text(
                                    RadarrCatalogueSorting.values[index].readable,
                                    style: TextStyle(
                                        fontSize: Constants.UI_FONT_SIZE_SUBTITLE,
                                    ),
                                ),
                                if(model.sortCatalogueType == RadarrCatalogueSorting.values[index]) Icon(
                                    model.sortCatalogueAscending
                                        ? Icons.arrow_upward
                                        : Icons.arrow_downward,
                                    size: Constants.UI_FONT_SIZE_SUBTITLE+2.0,
                                    color: LunaColours.accent,
                                ),
                            ],
                        ),
                    ),
                ),
            ), 
        ),
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 12.0),
        color: Theme.of(context).canvasColor,
    );

    void _scrollBack() {
        widget.controller.animateTo(
            1.00,
            duration: Duration(
                milliseconds: Constants.UI_NAVIGATION_SPEED*2,
            ),
            curve: Curves.easeOutSine,
        );
    }
}