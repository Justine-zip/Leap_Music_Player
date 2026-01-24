import 'package:flutter/material.dart';
import 'package:leap/components/circle_icon.dart';

class MusicPlayPage extends StatefulWidget {
  final String title;
  final String duration;
  const MusicPlayPage({super.key, required this.title, required this.duration});

  @override
  State<MusicPlayPage> createState() => _MusicPlayPageState();
}

class _MusicPlayPageState extends State<MusicPlayPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: MediaQuery.of(context).size.width * .6,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      //Music Albums or Songs
                      child: Center(child: SizedBox()),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('0:00'), Text(widget.duration)],
                    ),
                    SizedBox(height: 10),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 0,
                        ),
                        overlayShape: SliderComponentShape.noOverlay,
                      ),
                      child: Slider(
                        value: 30,
                        min: 0,
                        max: 100,
                        onChanged: (value) {
                          //Music Length
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),
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
                    icon: Icons.play_arrow_rounded,
                    iconSize: 60,
                    onTap: () {
                      //Music Play
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
            },
          ),
        ),
      ],
    );
  }
}
