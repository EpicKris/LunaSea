import 'package:lunasea/core.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringExtension on String {
    /// Returns a string with all first letters of each word capitalized
    /// 
    /// Default word splitting pattern is by a space.
    String lunaCapitalizeFirstLetters({ Pattern pattern = ' ' }) {
        List<String> split = this.split(pattern);
        for(var i=0; i<split.length; i++) {
            split[i] = split[i].substring(0, 1).toUpperCase()+split[i].substring(1);
        }
        return split.join(pattern);
    }

    /// Convert a string into a slug format.
    /// 
    /// Example "LunaSea Flutter" => 'lunasea-flutter';
    String lunaConvertToSlug() => this.toLowerCase().replaceAll(RegExp(r'[\ \.]'), '-').replaceAll(RegExp(r'[^a-zA-Z0-9\-]'), '').trim();
}

extension StringLinksExtension on String {
    Future<void> _openLink(String url) async {
        try {
            //Attempt to launch the link forced as a universal link
            if(await _launchUniversalLink(url)) return;
            //If that fails and we're using a custom browser, format the link for the correct browser and attempt to launch
            LunaBrowser _browser = LunaDatabaseValue.SELECTED_BROWSER.data;
            if(_browser != LunaBrowser.APPLE_SAFARI && await _launchCustomBrowser(_browser.formatted(url))) return;
            //If all else fails, just launch it in Safari/stock browser
            await _launch(url);
        } catch (error, stack) {
            LunaLogger().error('Unable to open link: $url', error, stack);
        }
    }

    Future<bool> _launchUniversalLink(String url) async => await launch(url, forceSafariVC: false, universalLinksOnly: true);
    Future<bool> _launchCustomBrowser(String url) async => await launch(url, forceSafariVC: false);
    Future<bool> _launch(String url) async => await launch(url);

    /// Attempt to open this string as a URL in a browser.
    Future<void> lunaOpenGenericLink() async => await _openLink(this);

    /// Attach this string as an ID/title to IMDB and attempt to launch it as a URL.
    Future<void> lunaOpenIMDB() async => await _openLink('https://www.imdb.com/title/$this');

    /// Attach this string as a video ID to YouTube and attempt to launch it as a URL.
    Future<void> lunaOpenYouTube() async => await _openLink('https://www.youtube.com/watch?v=$this');

    /// Attach this string as a movie ID to TheMovieDB and attempt to launch it as a URL.
    Future<void> lunaOpenTheMovieDB() async => await _openLink('https://www.themoviedb.org/movie/$this');

    /// Attach this string as a series ID to TheTVDB and attempt to launch it as a URL.
    Future<void> lunaOpenTheTVDB() async => await _openLink('https://www.thetvdb.com/?id=$this&tab=series');

    /// Attach this string as a series ID to TVMaze and attempt to launch it as a URL.
    Future<void> lunaOpenTVMaze() async => await _openLink('https://www.tvmaze.com/shows/$this');
}
