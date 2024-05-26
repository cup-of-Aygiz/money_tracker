import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_tracker/uikit/uikit.dart';

/// Поле для ввода с примененными стилями и дополненной логикой

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.labelText,
    this.initialText,
    this.hintText,
    this.prefixText,
    this.suffix,
    this.controller,
    this.focusNode,
    this.showDoneOverlay = false,
    this.readOnly = false,
    this.enable = true,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onSaved,
    this.onTap,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.textInputAction,
    this.autovalidateMode,
    this.autoFocus = false,
    this.maxLength,
    this.maxLines = 1,
    this.errorMaxLines = 1,
    this.textColor,
    this.border,
  }) : isLarge = false;

  /// Текст описывающий текстовое поле
  final String? labelText;

  /// Первоначальный текст
  final String? initialText;

  /// Текст показывающийся в качестве подсказки
  final String? hintText;

  /// Текст показывающийся в перед вводимым значением
  final String? prefixText;

  /// Иконка показывающийся справа в поле
  final Widget? suffix;

  /// Контроллер для получения информации текстового поля
  final TextEditingController? controller;

  /// Нода для получения информации о состоянии фокуса и тд...
  final FocusNode? focusNode;

  /// Показывать кнопку завершить над клавиатурой (только iOS)
  final bool showDoneOverlay;

  /// Разрешить только чтение
  /// (запрещает писать в поле, заходит при запросе следующего фокуса)
  final bool readOnly;

  /// Включить поле для ввода
  /// (Если false запрещает писать в поле, пропускает при запросе следующего фокуса)
  final bool? enable;

  /// Колбеки для обработки событий
  final Function(String)? onSubmitted, onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  /// Обработчики для вводимых значений
  final List<TextInputFormatter>? inputFormatters;

  final TextCapitalization textCapitalization;

  /// Тип клавиатуры (циферки, буковки, почта)
  final TextInputType? keyboardType;

  /// Главная кнопка в клавиатуре
  final TextInputAction? textInputAction;

  final AutovalidateMode? autovalidateMode;

  /// Фокусировать ли поле при показе поля
  final bool autoFocus;

  /// Максимальная длина поля
  final int? maxLength;

  /// Максимальное количество строк
  final int? maxLines;

  /// Максимальное количество строк у ошибки
  final int? errorMaxLines;

  /// Большое ли поле
  final bool isLarge;

  /// Кастомный цвет текста
  final Color? textColor;

  /// Кастомный бордер
  final InputBorder? border;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField>
    with WidgetsBindingObserver {
  late FocusNode _focusNode;
  late TextEditingController _controller;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialText);

    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        widget.onSubmitted?.call(_controller.text);
      }
    });
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        if (widget.showDoneOverlay) {
          _focusNode.unfocus();
        }
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,

      /// Basic
      controller: _controller,
      focusNode: _focusNode,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      autovalidateMode: widget.autovalidateMode,
      autofocus: widget.autoFocus,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,

      /// Callbacks
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      onSaved: widget.onSaved,
      onTap: widget.onTap,

      /// Status
      readOnly: widget.readOnly,
      enabled: widget.enable,

      /// TextStyle
      style: MaterialStateTextStyle.resolveWith(_getTextStyle),

      /// Cursor
      cursorColor: AppColors.white,

      decoration: InputDecoration(
        /// Label
        labelText: widget.labelText,
        labelStyle: MaterialStateTextStyle.resolveWith(_getLabelTextStyle),

        /// Hint
        hintText: widget.hintText,
        hintStyle: widget.isLarge
            ? AppTextStyle.body1SemiBold.copyWith(color: AppColors.onyx10)
            : AppTextStyle.body1SemiBold.copyWith(color: AppColors.onyx10),

        /// Suffix
        suffix: widget.suffix,

        /// Errors
        errorStyle:
            AppTextStyle.textAppCaption1SemiBold.copyWith(color: AppColors.red),
        errorMaxLines: widget.errorMaxLines,

        /// Paddings
        contentPadding: widget.isLarge
            ? const EdgeInsets.fromLTRB(16, 16, 16, 36)
            : const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),

        isCollapsed: widget.isLarge ? true : null,

        /// Borders

        border: widget.border ??
            const AppOutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.onyx60,
              ),
            ),
        focusedBorder: widget.border ??
            const AppOutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.onyx60,
              ),
            ),

        enabledBorder: widget.border ??
            const AppOutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.onyx60,
              ),
            ),

        errorBorder: widget.border ??
            const AppOutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.onyx60,
              ),
            ),

        focusedErrorBorder: widget.border ??
            const AppOutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.onyx60,
              ),
            ),

        disabledBorder: widget.border ??
            const AppOutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.onyx60,
              ),
            ),
      ),
    );
  }

  TextStyle _getTextStyle(Set<MaterialState> states) {
    if (states.contains(MaterialState.error)) {
      return AppTextStyle.body1SemiBold.copyWith(
        color: AppColors.white,
      );
    }

    return AppTextStyle.body1SemiBold
        .copyWith(color: widget.textColor ?? AppColors.white);
  }

  TextStyle _getLabelTextStyle(Set<MaterialState> states) {
    return AppTextStyle.body1SemiBold.copyWith(color: AppColors.white);
  }
}

/// Кастомные края для полей ввода
/// Совмещает поведение UnderlineInputBorder связанное с labelText
/// и рисует края как у OutlineInputBorder
class AppOutlineInputBorder extends UnderlineInputBorder {
  const AppOutlineInputBorder({
    super.borderSide = const BorderSide(),
    super.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  bool get isOutline => false;

  /// Для красивого перехода между разными состояниями Border
  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is AppOutlineInputBorder) {
      final outline = a;
      return AppOutlineInputBorder(
        borderSide: BorderSide.lerp(outline.borderSide, borderSide, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  Path _gapBorderPath(
    RRect center,
  ) {
    // Верхний левый угол
    final Rect tlCorner = Rect.fromLTWH(
      center.left,
      center.top,
      center.tlRadiusX * 2.0,
      center.tlRadiusY * 2.0,
    );

    // Верхний правый угол
    final Rect trCorner = Rect.fromLTWH(
      center.right - center.trRadiusX * 2.0,
      center.top,
      center.trRadiusX * 2.0,
      center.trRadiusY * 2.0,
    );

    // Нижний правый угол
    final Rect brCorner = Rect.fromLTWH(
      center.right - center.brRadiusX * 2.0,
      center.bottom - center.brRadiusY * 2.0,
      center.brRadiusX * 2.0,
      center.brRadiusY * 2.0,
    );

    // Нижний левый угол
    final Rect blCorner = Rect.fromLTWH(
      center.left,
      center.bottom - center.blRadiusY * 2.0,
      center.blRadiusX * 2.0,
      center.blRadiusY * 2.0,
    );

    const double cornerArcSweep = 1.5708; // pi / 2.0
    final Path path = Path();

    // Рисуем верхний левый угол
    if (center.tlRadius != Radius.zero) {
      path.addArc(tlCorner, pi, cornerArcSweep);
    }

    // Рисуем верхнюю границу до правого верхнего угла
    path.lineTo(center.right - center.trRadiusX, center.top);

    // Рисуем правый верхний угол
    if (center.trRadius != Radius.zero) {
      path.addArc(trCorner, -pi / 2.0, cornerArcSweep);
    }

    // Рисуем границу слева до правого нижнего угла
    path.lineTo(center.right, center.bottom - center.brRadiusY);

    // Рисуем правый нижний угол
    if (center.brRadius != Radius.zero) {
      path.addArc(brCorner, 0.0, cornerArcSweep);
    }

    // Рисуем границу c низу до левого нижнего угла
    path.lineTo(center.left + center.blRadiusX, center.bottom);

    // Рисуем левый нижний угол
    if (center.blRadius != Radius.zero) {
      path.addArc(blCorner, pi / 2.0, cornerArcSweep);
    }

    // Рисуем границу снизу до левого верхнего угла
    path.lineTo(center.left, center.top + center.tlRadiusY);

    return path;
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    final Paint paint = borderSide.toPaint();
    final RRect outer = borderRadius.toRRect(rect);
    final RRect center = outer.deflate(borderSide.width / 2.0);

    final Path path = _gapBorderPath(center);
    canvas.drawPath(path, paint);
  }
}
