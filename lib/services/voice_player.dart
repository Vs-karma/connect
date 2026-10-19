import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';

/// A single app-wide audio player for voice notes, so only one plays at a time.
/// Voice bubbles listen to this and compare [currentId] to know if they're active.
class VoicePlayer extends ChangeNotifier {
  VoicePlayer._() {
    _player.playerStateStream.listen((s) {
      if (s.processingState == ProcessingState.completed) {
        _player.pause();
        _player.seek(Duration.zero);
      }
      notifyListeners();
    });
    _player.positionStream.listen((_) => notifyListeners());
    _player.durationStream.listen((_) => notifyListeners());
  }

  static final VoicePlayer instance = VoicePlayer._();

  final AudioPlayer _player = AudioPlayer();

  String? _currentId;
  String? get currentId => _currentId;

  bool get playing => _player.playing;
  Duration get position => _player.position;

  /// Reported clip length — prefers the player's own, falling back to a hint (ms).
  Duration durationFor(int? hintMs) {
    final d = _player.duration;
    if (d != null && d.inMilliseconds > 0) return d;
    return Duration(milliseconds: hintMs ?? 0);
  }

  /// Toggle play/pause for [id] (its audio at [url]). Starting one stops the other.
  Future<void> toggle(String id, String url) async {
    try {
      if (_currentId == id) {
        if (_player.playing) {
          await _player.pause();
        } else {
          await _player.play();
        }
        return;
      }
      _currentId = id;
      notifyListeners();
      await _player.setUrl(url);
      await _player.play();
    } catch (_) {
      _currentId = null;
      notifyListeners();
    }
  }

  Future<void> seekTo(Duration pos) => _player.seek(pos);

  bool isActive(String id) => _currentId == id;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
