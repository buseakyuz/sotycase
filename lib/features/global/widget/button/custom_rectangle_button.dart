import 'package:flutter/material.dart';
import 'package:sotycase/features/global/progress/custom_circular_progress_indicator.dart';

import '../../../../core/constants/layout_constants.dart';

class CustomRectangleButton extends StatelessWidget {
  final Color? color;
  final Color? borderColor;
  final bool isProcess;
  final bool paddingEnable;
  final IconData? icon;
  final String text;
  final Color? textColor;
  final Color? iconColor;
  final double borderWidth;
  final Function()? onTap;
  final Function()? onLongPress;
  const CustomRectangleButton({
    super.key,
    this.color,
    this.isProcess = false,
    this.icon,
    required this.text,
    this.textColor,
    this.onTap,
    this.onLongPress,
    this.iconColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.paddingEnable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingEnable ? LayoutConstants.buttonPadding : EdgeInsets.zero,
      child: InkWell(
        onTap: isProcess ? null : onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: _getBorderColor(context),
              width: borderWidth,
            ),
            color: !isProcess ? _getButtonColor(context) : Colors.transparent,
          ),
          child: Center(
            child: Padding(
              padding: LayoutConstants.centralAllPadding,
              child: isProcess
                  ? const CustomCircularProgressIndicator()
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        icon != null
                            ? Icon(
                                icon,
                                color:
                                    iconColor ??
                                    Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.color!,
                                size: 24,
                              )
                            : const SizedBox(),
                        Expanded(
                          child: Text(
                            text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _getTextColor(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getTextColor(BuildContext context) {
    return onTap != null
        ? (textColor ?? Theme.of(context).primaryColor)
        : _getDisableColor(context);
  }

  Color _getButtonColor(BuildContext context) {
    return onTap != null
        ? (color ?? Colors.white)
        : Theme.of(context).splashColor;
  }

  Color _getBorderColor(BuildContext context) {
    return onTap != null && !isProcess
        ? borderColor ?? (color ?? Colors.white)
        : _getDisableColor(context);
  }

  Color _getDisableColor(BuildContext context) {
    return Theme.of(
      context,
    ).textTheme.bodyMedium!.color!.withValues(alpha: 0.4);
  }
}
