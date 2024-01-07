import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kosh_killa_app/config/constants/app_routes.dart';
import 'package:kosh_killa_app/core/failure/failure.dart';
import 'package:kosh_killa_app/features/auth/domain/use_case/auth_usecase.dart';
import 'package:kosh_killa_app/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mockito/mockito.dart';

import '../test/features/auth/presentation/viewmodel/auth_view_model_test.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AuthUseCase mockAuthUsecase;
  late BuildContext mockBuildContext;
  late Failure mockFailure;

  setUpAll(() async {
    mockAuthUsecase = MockAuthUseCase();
    mockBuildContext = MockBuildContext();
    when(
      mockAuthUsecase.registerUser(
        username: 'astika',
        password: 'password123',
        email: 'astika@gmail.com',
      ),
    ).thenAnswer(
      (_) async => const Right(true),
    );
  });

  testWidgets('login test with credentials', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider.overrideWith(
            (ref) => AuthViewModel(mockAuthUsecase),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.registerRoute,
          routes: AppRoute.getApplicationRoute(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), 'astika');
    await tester.enterText(find.byType(TextField).at(1), 'astika@gmail.com');
    await tester.enterText(find.byType(TextField).at(2), 'password123');
    await tester.enterText(find.byType(TextField).at(3), 'password123');
    await tester.pumpAndSettle();

    await tester.tap(
      find.widgetWithText(ElevatedButton, 'SIGNUP'),
    );
    await tester.pumpAndSettle();

    // Verify that our counter has incremented.
    expect(find.text('User Registered Successfully'), findsOneWidget);
  });

  // testWidgets('signup test without credentials', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(
  //     ProviderScope(
  //       overrides: [
  //         authViewModelProvider.overrideWith(
  //           (ref) => AuthViewModel(mockAuthUsecase),
  //         ),
  //       ],
  //       child: MaterialApp(
  //         debugShowCheckedModeBanner: false,
  //         initialRoute: AppRoute.registerRoute,
  //         routes: AppRoute.getApplicationRoute(),
  //       ),
  //     ),
  //   );

  //   await tester.pumpAndSettle();

  //   await tester.enterText(find.byType(TextField).at(0), '');
  //   await tester.enterText(find.byType(TextField).at(1), '');

  //   await tester.tap(
  //     find.widgetWithText(ElevatedButton, 'Login'),
  //   );
  //   await tester.pumpAndSettle();

  //   // Verify that our counter has incremented.
  //   expect(find.text('Please enter your username'), findsOneWidget);
  // });

  // testWidgets('signup test with only username', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(
  //     ProviderScope(
  //       overrides: [
  //         authViewModelProvider.overrideWith(
  //           (ref) => AuthViewModel(mockAuthUsecase),
  //         ),
  //       ],
  //       child: MaterialApp(
  //         debugShowCheckedModeBanner: false,
  //         initialRoute: AppRoute.registerRoute,
  //         routes: AppRoute.getApplicationRoute(),
  //       ),
  //     ),
  //   );

  //   await tester.pumpAndSettle();

  //   await tester.enterText(find.byType(TextField).at(0), 'astika');
  //   await tester.enterText(find.byType(TextField).at(1), '');

  //   await tester.tap(
  //     find.widgetWithText(ElevatedButton, 'Login'),
  //   );
  //   await tester.pumpAndSettle();

  //   // Verify that our counter has incremented.
  //   expect(find.text('Please enter your username'), findsOneWidget);
  // });
}
