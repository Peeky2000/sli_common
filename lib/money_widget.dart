import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sli_common/extension/extensions.dart';

class MoneyWidget extends StatelessWidget {
  static String unitDefault = 'đ';

  final String? unit;
  final num? amount;
  final TextStyle? textStyle;
  final TextStyle? unitStyle;
  final bool? isBold;
  final bool? isBigSize;
  final double? fontSize;
  final TextAlign? textAlign;
  final Color? color;
  final bool? hasSign;
  const MoneyWidget({
    Key? key,
    this.amount,
    this.unit,
    this.textStyle,
    this.unitStyle,
    this.isBigSize = false,
    this.isBold = false,
    this.fontSize,
    this.textAlign,
    this.color,
    this.hasSign = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
        style: getTextStyle(context),
        text: hasSign == true && (amount ?? 0) > 0 ? '+' : '',
        children: [
          TextSpan(text: (amount ?? 0).currencyFormat),
          TextSpan(
            text: (unit ?? unitDefault),
            style: unitStyle ?? getTextStyle(context),
          ),
        ],
      ),
      style: getTextStyle(context),
      textAlign: textAlign,
      maxLines: 1,
    );
  }

  getTextStyle(BuildContext context) {
    return textStyle ??
        TextStyle(
          fontSize: fontSize ??
              (isBigSize == true
                  ? Theme.of(context).textTheme.headlineLarge?.fontSize
                  : null),
          fontWeight: isBold == true ? FontWeight.w600 : FontWeight.w500,
          color: color,
        );
  }
}
