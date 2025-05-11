import 'package:boby_movie_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class UnlockButton extends StatefulWidget {
  const UnlockButton({super.key, this.onPressed, required this.unlockText, required this.isEnableAnimation});

  final String unlockText;
  final void Function()? onPressed;
  final bool isEnableAnimation;

  @override
  State<UnlockButton> createState() => _UnlockButtonState();
}

class _UnlockButtonState extends State<UnlockButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  late bool _isAnimating;

  @override
  void initState() {
    super.initState();

    _isAnimating = widget.isEnableAnimation;

    _controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    final double minWidth = 330;
    final double maxWidth = 380;
    _widthAnimation = Tween<double>(begin: minWidth, end: maxWidth).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (_isAnimating) {
      _controller.repeat(reverse: true);
    }
  }

  void _handleTap() {
    widget.onPressed?.call();

    if (_isAnimating) {
      _controller.stop();
      setState(() {
        _isAnimating = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isEnableAnimation == false) {
      return GestureDetector(
        onTap: _handleTap,
        child: Container(
          transform: _isAnimating ? Matrix4.identity() : Matrix4.translationValues(0, 20, 0),
          transformAlignment: Alignment.center,
          padding: EdgeInsets.all(18),
          width: double.infinity,
          decoration: BoxDecoration(color: AppTheme.redLight, borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Text(widget.unlockText, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          ),
        ),
      );
    }
    return AnimatedBuilder(
      animation: _widthAnimation,
      builder: (context, child) {
        return GestureDetector(
          onTap: _handleTap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 10),
            curve: Curves.easeInOut,

            transform: _isAnimating ? Matrix4.identity() : Matrix4.translationValues(0, 20, 0),
            transformAlignment: Alignment.center,
            padding: EdgeInsets.all(12),
            width: _isAnimating ? _widthAnimation.value : double.infinity,
            decoration: BoxDecoration(color: AppTheme.redLight, borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Text(widget.unlockText, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            ),
          ),
        );
      },
    );
  }
}
