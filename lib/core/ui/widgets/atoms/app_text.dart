import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText._(
    this.data, {
    required this.variant,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.semanticsLabel, Key? key,
  });

  const AppText.display(
    String data, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    String? semanticsLabel,
  }) : this._(
         data,
         key: key,
         variant: AppTextVariant.display,
         color: color,
         textAlign: textAlign,
         maxLines: maxLines,
         overflow: overflow,
         fontWeight: fontWeight,
         semanticsLabel: semanticsLabel,
       );

  const AppText.heading(
    String data, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    String? semanticsLabel,
  }) : this._(
         data,
         key: key,
         variant: AppTextVariant.heading,
         color: color,
         textAlign: textAlign,
         maxLines: maxLines,
         overflow: overflow,
         fontWeight: fontWeight,
         semanticsLabel: semanticsLabel,
       );

  const AppText.title(
    String data, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    String? semanticsLabel,
  }) : this._(
         data,
         key: key,
         variant: AppTextVariant.title,
         color: color,
         textAlign: textAlign,
         maxLines: maxLines,
         overflow: overflow,
         fontWeight: fontWeight,
         semanticsLabel: semanticsLabel,
       );

  const AppText.body(
    String data, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    String? semanticsLabel,
  }) : this._(
         data,
         key: key,
         variant: AppTextVariant.body,
         color: color,
         textAlign: textAlign,
         maxLines: maxLines,
         overflow: overflow,
         fontWeight: fontWeight,
         semanticsLabel: semanticsLabel,
       );

  const AppText.paragraph(
    String data, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    String? semanticsLabel,
  }) : this._(
         data,
         key: key,
         variant: AppTextVariant.paragraph,
         color: color,
         textAlign: textAlign,
         maxLines: maxLines,
         overflow: overflow,
         fontWeight: fontWeight,
         semanticsLabel: semanticsLabel,
       );

  const AppText.caption(
    String data, {
    Key? key,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    String? semanticsLabel,
  }) : this._(
         data,
         key: key,
         variant: AppTextVariant.caption,
         color: color,
         textAlign: textAlign,
         maxLines: maxLines,
         overflow: overflow,
         fontWeight: fontWeight,
         semanticsLabel: semanticsLabel,
       );

  final String data;
  final AppTextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final baseStyle = switch (variant) {
      AppTextVariant.display => textTheme.headlineLarge,
      AppTextVariant.heading => textTheme.headlineSmall,
      AppTextVariant.title => textTheme.titleMedium,
      AppTextVariant.body => textTheme.bodyLarge,
      AppTextVariant.paragraph => textTheme.bodyMedium,
      AppTextVariant.caption => textTheme.bodySmall,
    };

    return Text(
      data,
      semanticsLabel: semanticsLabel,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: baseStyle?.copyWith(color: color, fontWeight: fontWeight),
    );
  }
}

enum AppTextVariant { display, heading, title, body, paragraph, caption }
