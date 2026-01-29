import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leap/components/circle_icon.dart';
import 'package:leap/provider/music_player_provider.dart';

class MusicPlayPage extends ConsumerStatefulWidget {
  final String id;
  final String title;
  final String owner;
  final String? thumbnail;
  final String duration;
  const MusicPlayPage({
    super.key,
    required this.id,
    required this.title,
    required this.owner,
    required this.duration,
    this.thumbnail,
  });

  @override
  ConsumerState<MusicPlayPage> createState() => _MusicPlayPageState();
}

class _MusicPlayPageState extends ConsumerState<MusicPlayPage> {
  bool isPlaying = true;

  double currentSeconds = 0;
  double totalSeconds = 1;

  Timer? progressTimer;

  void startFakeProgress() {
    progressTimer?.cancel();
    progressTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;

      setState(() {
        if (currentSeconds < totalSeconds) {
          currentSeconds += 1;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();

    startFakeProgress();
  }

  @override
  Widget build(BuildContext context) {
    final musicPlayer = ref.watch(musicPlayerProvider);

    if (musicPlayer == null) {
      return const SizedBox();
    }
    return Stack(
      children: [
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * .55,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          //Music Albums or Songs
                          child: SizedBox(
                            child: Image.network('${widget.thumbnail}'),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: CircleIcon(
                          icon: Icons.favorite_rounded,
                          iconSize: 16,
                          onTap: () {
                            //Add music to library
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Text(
                  textAlign: TextAlign.center,
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              SizedBox(height: 2),
              Text(
                widget.owner,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${(currentSeconds ~/ 60).toString().padLeft(1, '0')}:${(currentSeconds % 60).toInt().toString().padLeft(2, '0')}',
                        ),

                        Text(
                          '${(totalSeconds ~/ 60).toString().padLeft(1, '0')}:${(totalSeconds % 60).toInt().toString().padLeft(2, '0')}',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 0,
                        ),
                        overlayShape: SliderComponentShape.noOverlay,
                      ),
                      child: Slider(
                        value: currentSeconds.clamp(0, totalSeconds),
                        min: 0,
                        max: totalSeconds,
                        onChanged: (value) {
                          //Music Length
                          musicPlayer.seekTo(seconds: value);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleIcon(
                    icon: Icons.skip_previous_rounded,
                    iconSize: 24,
                    onTap: () {
                      //Music PlayPrevious
                    },
                  ),
                  SizedBox(width: 12),
                  CircleIcon(
                    icon:
                        isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                    iconSize: 60,
                    onTap: () {
                      setState(() {
                        if (isPlaying) {
                          ref.read(musicPlayerProvider.notifier).pause();
                        } else {
                          ref.read(musicPlayerProvider.notifier).resume();
                        }
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                  SizedBox(width: 12),
                  CircleIcon(
                    icon: Icons.skip_next_rounded,
                    iconSize: 24,
                    onTap: () {
                      //Music PlayNext
                    },
                  ),
                  SizedBox(width: 12),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: CircleIcon(
            icon: Icons.keyboard_backspace_rounded,
            iconSize: 24,
            onTap: () {
              //Back to previous page
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
