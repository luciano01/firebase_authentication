import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/authentication/data/datasource/authentication_data_source.dart';
import 'package:firebase_authentication/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:firebase_authentication/authentication/domain/repositories/authentication_repository.dart';
import 'package:firebase_authentication/authentication/domain/usecases/get_authentication.dart';
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
      ];
}
