import 'package:movie_magic/core/core.dart';
import 'package:movie_magic/features/main_app/main_app_index.dart';
import 'package:movie_magic/features/shared/shared_index.dart';
import 'package:movie_magic/navigation/helpers/func.dart';

class MainAppScreen extends StatelessWidget {
  const MainAppScreen({required this.child, super.key});
  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          if (child.currentIndex != 0) {
            goHome(context);
          } else {
            showExitDialog(context);
          }
        }
      },
      child: BaseScaffold(
        body: child,
        bottomNavigationBar: NavBar(
          currentIndex: child.currentIndex,
          onTap: child.goBranch,
        ),
      ),
    );
  }
}
