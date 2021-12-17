import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/authentication/data/datasource/authentication_data_source.dart';
import 'package:firebase_authentication/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:firebase_authentication/authentication/domain/repositories/authentication_repository.dart';
import 'package:firebase_authentication/authentication/domain/usecases/get_authentication.dart';
import 'package:firebase_authentication/authentication/presentation/mobx/authentication/authentication_store.dart';
import 'package:firebase_authentication/authentication/presentation/mobx/home/home_store.dart';
import 'package:firebase_authentication/authentication/presentation/mobx/launch/launch_store.dart';
import 'package:firebase_authentication/authentication/presentation/mobx/login/login_store.dart';
import 'package:firebase_authentication/authentication/presentation/pages/home/home_page.dart';
import 'package:firebase_authentication/authentication/presentation/pages/launch/launch_page.dart';
import 'package:firebase_authentication/authentication/presentation/pages/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // External
        Bind((i) => FirebaseAuth.instance),

        // DataSource
        Bind<AuthenticationDataSource>(
          (i) => AuthenticationDataSourceImpl(
            firebaseAuth: i.get<FirebaseAuth>(),
          ),
        ),

        // Repository
        Bind(
          (i) => AuthenticationRepositoryImpl(
            dataSource: i.get<AuthenticationDataSource>(),
          ),
        ),

        // Use cases
        Bind(
          (i) => GetAuthentication(
            repository: i.get<AuthenticationRepository>(),
          ),
        ),

        // Store
        Bind(
          (i) => AuthenticationStore(
            usecase: i.get<GetAuthentication>(),
          ),
        ),
        Bind(
          (i) => HomeStore(
            authenticationStore: i.get<AuthenticationStore>(),
          ),
        ),
        Bind(
          (i) => LaunchStore(
            authenticationStore: i.get<AuthenticationStore>(),
          ),
        ),
        Bind(
          (i) => LoginStore(
            authenticationStore: i.get<AuthenticationStore>(),
          ),
        ),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const LaunchPage(),
    ),
    ChildRoute(
      '/login',
      child: (context, args) => const LoginPage(),
    ),
    ChildRoute(
      '/home',
      child: (context, args) => const HomePage(),
    ),
  ];
}
