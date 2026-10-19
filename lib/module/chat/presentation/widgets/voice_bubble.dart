import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/services/voice_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A voice-note bubble: play/pause, a simple progress bar, and the duration.
/// All bubbles share [VoicePlayer.instance] so only one plays at a time.
class VoiceBubble extends StatelessWidget {
  final String messageId;
  final String url;
  final int? durationMs;
  final bool mine;
  final bool uploading; // optimistic message still being sent
  final bool failed;

  const VoiceBubble({
    super.key,
    required this.messageId,
    required this.url,
    required this.durationMs,
    required this.mine,
    this.uploading = false,
    this.failed = false,
  });

  String _fmt(Duration d) {
    final m = d.inMinutes.remainder(60).toString();
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    final bg = mine ? AppColors.primary.withValues(alpha: 0.12) : AppColors.surface;
    final accent = AppColors.primary;

    return Container(
      width: 232.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16.r)),
      child: AnimatedBuilder(
        animation: VoicePlayer.instance,
        builder: (context, _) {
          final player = VoicePlayer.instance;
          final active = player.isActive(messageId);
          final playing = active && player.playing;
          final total = active
              ? player.durationFor(durationMs)
              : Duration(milliseconds: durationMs ?? 0);
          final pos = active ? player.position : Duration.zero;
          final frac = (total.inMilliseconds > 0)
              ? (pos.inMilliseconds / total.inMilliseconds).clamp(0.0, 1.0)
              : 0.0;
          final label = active && pos > Duration.zero ? _fmt(pos) : _fmt(total);

          return Row(
            children: [
              _control(context, accent, playing, active),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _bar(frac, accent),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Icon(Icons.mic, size: 13.sp, color: AppColors.textSecondary),
                        SizedBox(width: 4.w),
                        Text(
                          failed ? 'Failed' : label,
                          style: AppTextStyles.style11px.w500.copyWith(
                              color: failed ? AppColors.danger : AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _control(BuildContext context, Color accent, bool playing, bool active) {
    if (uploading) {
      return SizedBox(
        width: 34.w,
        height: 34.w,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: CircularProgressIndicator(strokeWidth: 2, color: accent),
        ),
      );
    }
    return GestureDetector(
      onTap: () => VoicePlayer.instance.toggle(messageId, url),
      child: Container(
        width: 34.w,
        height: 34.w,
        decoration: BoxDecoration(color: accent, shape: BoxShape.circle),
        child: Icon(playing ? Icons.pause : Icons.play_arrow,
            color: AppColors.onPrimary, size: 20.sp),
      ),
    );
  }

  Widget _bar(double frac, Color accent) {
    return LayoutBuilder(
      builder: (context, c) {
        return Stack(
          children: [
            Container(
              height: 4.h,
              decoration: BoxDecoration(
                  color: AppColors.border, borderRadius: BorderRadius.circular(3.r)),
            ),
            Container(
              height: 4.h,
              width: c.maxWidth * frac,
              decoration: BoxDecoration(color: accent, borderRadius: BorderRadius.circular(3.r)),
            ),
          ],
        );
      },
    );
  }
}
