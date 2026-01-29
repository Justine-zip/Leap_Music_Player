import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leap/components/circle_icon.dart';
import 'package:leap/pages/music_library_page.dart';
import 'package:leap/pages/music_page.dart';
import 'package:leap/provider/music_player_provider.dart';
import 'package:leap/provider/theme_provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(musicPlayerProvider);
    debugPrint(
      'Controller Status: ${controller != null ? 'active' : 'inactive'}',
    );
    final themes = ref.watch(themeProvider);
    return DefaultTabController(
      length: 2,
      child: Stack(
        children: [
          Scaffold(
            body: const TabBarView(children: [MusicPage(), MusicLibraryPage()]),
          ),
          if (controller != null)
            Offstage(
              offstage: true,
              child: SizedBox(
                width: 300,
                height: 200,
                child: YoutubePlayer(controller: controller),
              ),
            ),
          Positioned(
            top: 20,
            left: 20,
            child: CircleIcon(
              icon: themes ? Icons.wb_sunny_rounded : Icons.dark_mode_rounded,
              iconSize: 24,
              onTap: () {
                ref.read(themeProvider.notifier).toggleTheme();
                debugPrint('Theme: $themes');
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.primaryContainer,
              child: TabBar(
                dividerColor: Colors.transparent,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.library_music_rounded)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
