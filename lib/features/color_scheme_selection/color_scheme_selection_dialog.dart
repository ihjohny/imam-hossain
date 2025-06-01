import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/responsive_ext.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/generated/localization/locale_keys.g.dart';

import '../../core/theme/app_theme.dart';
import '../../core/theme/app_theme_service.dart';
import '../../core/utils/constants/sizes.dart';
import '../../di/di_setup.dart';
import '../common/widgets/app_cursors_button_widget.dart';

class ColorSchemeSelectionDialog extends StatefulWidget {
  const ColorSchemeSelectionDialog({super.key});

  @override
  State<ColorSchemeSelectionDialog> createState() =>
      _ColorSchemeSelectionDialogState();
}

class _ColorSchemeSelectionDialogState
    extends State<ColorSchemeSelectionDialog> {
  final themeService = getIt<AppThemeService>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedScheme();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.px16),
      ),
      child: Container(
        width: _getDialogWidth(context),
        height: _getDialogHeight(context),
        padding: EdgeInsets.all(context.isDesktop ? Sizes.px32 : Sizes.px24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr(LocaleKeys.colorSchemeSelectionTitle),
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppCursorsButtonWidget(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const VerticalSpacing(Sizes.px16),
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _getCrossAxisCount(context),
                  crossAxisSpacing: _getGridSpacing(context),
                  mainAxisSpacing: _getGridSpacing(context),
                  childAspectRatio: 1.2,
                ),
                itemCount: FlexScheme.values.length,
                itemBuilder: (context, index) {
                  final scheme = FlexScheme.values[index];
                  return _ColorSchemeCard(
                    scheme: scheme,
                    isSelected: themeService.currentColorScheme == scheme,
                    onTap: () {
                      themeService.updateColorScheme(scheme);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToSelectedScheme() {
    final currentScheme = themeService.currentColorScheme;
    const schemes = FlexScheme.values;
    final selectedIndex = schemes.indexOf(currentScheme);

    if (selectedIndex != -1) {
      final crossAxisCount = _getCrossAxisCount(context);
      final row = selectedIndex ~/ crossAxisCount;
      final itemHeight = _getItemHeight(context);
      final spacing = _getGridSpacing(context);

      final dialogHeight = _getDialogHeight(context);
      const headerHeight = 64.0;
      final padding = context.isDesktop ? Sizes.px32 * 2 : Sizes.px24 * 2;
      final visibleGridHeight = dialogHeight - headerHeight - padding;

      final visibleRows = visibleGridHeight / (itemHeight + spacing);

      final targetRow = row - (visibleRows / 2).floor();
      final scrollOffset =
          (targetRow * (itemHeight + spacing)).clamp(0.0, double.infinity);

      _scrollController.animateTo(
        scrollOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  int _getCrossAxisCount(BuildContext context) {
    if (context.isDesktop) return 5;
    if (context.isTablet) return 4;
    return 3;
  }

  double _getGridSpacing(BuildContext context) {
    if (context.isDesktop) return Sizes.px20;
    if (context.isTablet) return Sizes.px16;
    return Sizes.px12;
  }

  double _getDialogWidth(BuildContext context) {
    if (context.isDesktop) return context.mediaQuerySize.width * 0.7;
    if (context.isTablet) return context.mediaQuerySize.width * 0.8;
    return context.mediaQuerySize.width * 0.9;
  }

  double _getDialogHeight(BuildContext context) {
    if (context.isDesktop) return context.mediaQuerySize.height * 0.8;
    if (context.isTablet) return context.mediaQuerySize.height * 0.8;
    return context.mediaQuerySize.height * 0.8;
  }

  double _getItemHeight(BuildContext context) {
    final dialogWidth = _getDialogWidth(context);
    final padding = context.isDesktop ? Sizes.px32 * 2 : Sizes.px24 * 2;
    final availableWidth = dialogWidth - padding;
    final crossAxisCount = _getCrossAxisCount(context);
    final spacing = _getGridSpacing(context);
    final totalSpacing = spacing * (crossAxisCount - 1);
    final itemWidth = (availableWidth - totalSpacing) / crossAxisCount;
    return itemWidth / 1.2;
  }
}

class _ColorSchemeCard extends StatelessWidget {
  final FlexScheme scheme;
  final bool isSelected;
  final VoidCallback onTap;

  const _ColorSchemeCard({
    required this.scheme,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final previewTheme =
        context.isDarkMode ? AppTheme.dark(scheme) : AppTheme.light(scheme);

    return AppCursorsButtonWidget(
      onPressed: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.px12),
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.outline.withValues(alpha: .5),
            width: isSelected ? 3 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: context.colorScheme.primary.withValues(alpha: .3),
                    blurRadius: Sizes.px8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isSelected ? 9 : 11),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        previewTheme.colorScheme.primary,
                        previewTheme.colorScheme.primary,
                        previewTheme.colorScheme.secondary,
                        previewTheme.colorScheme.tertiary,
                      ],
                      stops: const [0.0, 0.6, 0.8, 1.0],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: Sizes.px8,
                        left: Sizes.px8,
                        child: Row(
                          children: [
                            _ColorSwatch(
                              color: previewTheme.colorScheme.primary,
                              size: _getSwatchSize(context, 20, 18, 16),
                            ),
                            spaceW4,
                            _ColorSwatch(
                              color: previewTheme.colorScheme.secondary,
                              size: _getSwatchSize(context, 16, 14, 12),
                            ),
                            spaceW4,
                            _ColorSwatch(
                              color: previewTheme.colorScheme.tertiary,
                              size: _getSwatchSize(context, 12, 10, 8),
                            ),
                          ],
                        ),
                      ),
                      if (isSelected)
                        _SelectionIndicator(previewTheme: previewTheme),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: context.isMobile ? 2 : 1,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.isMobile ? Sizes.px4 : Sizes.px8,
                    vertical: context.isMobile ? Sizes.px2 : Sizes.px4,
                  ),
                  color: context.colorScheme.surfaceContainerHighest,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _getSchemeDisplayName(scheme),
                        style: context.textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onSurface,
                          fontSize: _getAdaptiveTextSize(context),
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getSchemeDisplayName(FlexScheme scheme) {
    final name = scheme.name;
    return name
        .replaceAllMapped(
          RegExp(r'([a-z])([A-Z])'),
          (match) => '${match.group(1)} ${match.group(2)}',
        )
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  double _getAdaptiveTextSize(BuildContext context) {
    if (context.isDesktop) return 12.0;
    if (context.isTablet) return 11.0;
    return 9.0;
  }

  double _getSwatchSize(
      BuildContext context, double desktop, double tablet, double mobile) {
    if (context.isDesktop) return desktop;
    if (context.isTablet) return tablet;
    return mobile;
  }
}

class _ColorSwatch extends StatelessWidget {
  final Color color;
  final double size;

  const _ColorSwatch({
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size / 4),
        border: Border.all(
          color: context.colorScheme.onPrimary.withValues(alpha: .3),
          width: 1,
        ),
      ),
    );
  }
}

class _SelectionIndicator extends StatelessWidget {
  const _SelectionIndicator({
    required this.previewTheme,
  });

  final ThemeData previewTheme;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Sizes.px8,
      right: Sizes.px8,
      child: Container(
        padding: const EdgeInsets.all(Sizes.px4),
        decoration: BoxDecoration(
          color: context.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(Sizes.px12),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha: .3),
              blurRadius: Sizes.px4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          Icons.check,
          size: Sizes.px16,
          color: previewTheme.colorScheme.primary,
        ),
      ),
    );
  }
}
