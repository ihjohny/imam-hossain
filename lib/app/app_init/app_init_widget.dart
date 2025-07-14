import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

import '../../core/utils/constants/sizes.dart';
import '../../di/di_setup.dart';
import 'app_init_service.dart';

class AppInitWidget extends StatelessWidget {
  const AppInitWidget({
    super.key,
    required this.onLoaded,
  });

  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context) {
    final appInitService = getIt<AppInitService>();

    appInitService.appStartup();

    return StreamBuilder<bool>(
      stream: appInitService.isSuccess,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          return onLoaded(context);
        } else if (snapshot.hasError) {
          return AppInitErrorWidget(
            message: snapshot.error.toString(),
            onRetry: () => appInitService.appStartup(),
          );
        } else {
          return const AppInitLoadingWidget();
        }
      },
    );
  }
}

class AppInitLoadingWidget extends StatelessWidget {
  const AppInitLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: context.colorScheme.onPrimary,
    );
  }
}

class AppInitErrorWidget extends StatelessWidget {
  const AppInitErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                style: context.textTheme.headlineSmall,
              ),
              spaceH16,
              ElevatedButton(
                onPressed: onRetry,
                child: const Icon(Icons.restart_alt),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
