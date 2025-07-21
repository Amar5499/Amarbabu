import 'package:amarbabu_portfolio/features/about/about_page.dart';
import 'package:amarbabu_portfolio/features/contact/contact_page.dart';
import 'package:amarbabu_portfolio/features/home/home_page.dart';
import 'package:amarbabu_portfolio/features/projects/projects_page.dart';
import 'package:amarbabu_portfolio/features/skills/skills_page.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: AboutRoute.page),
        AutoRoute(page: ProjectsRoute.page),
        AutoRoute(page: SkillsRoute.page),
        AutoRoute(page: ContactRoute.page),
      ];
}
