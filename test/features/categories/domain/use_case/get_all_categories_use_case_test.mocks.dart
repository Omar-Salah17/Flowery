// Mocks generated by Mockito 5.4.5 from annotations
// in flowery/test/features/categories/domain/use_case/get_all_categories_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flowery/core/utils/error_handler.dart' as _i5;
import 'package:flowery/features/categories/data/models/categories_model/category.dart'
    as _i6;
import 'package:flowery/features/categories/data/models/products_model/product.dart'
    as _i7;
import 'package:flowery/features/categories/domain/repos/categories_screen_repo.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [CategoriesScreenRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockCategoriesScreenRepo extends _i1.Mock
    implements _i3.CategoriesScreenRepo {
  MockCategoriesScreenRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Category>>> getAllCategories() =>
      (super.noSuchMethod(
            Invocation.method(#getAllCategories, []),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, List<_i6.Category>>>.value(
                  _FakeEither_0<_i5.Failure, List<_i6.Category>>(
                    this,
                    Invocation.method(#getAllCategories, []),
                  ),
                ),
          )
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Category>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i7.Product>>> getProductsByCategory({
    String? categoryId,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#getProductsByCategory, [], {
              #categoryId: categoryId,
            }),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, List<_i7.Product>>>.value(
                  _FakeEither_0<_i5.Failure, List<_i7.Product>>(
                    this,
                    Invocation.method(#getProductsByCategory, [], {
                      #categoryId: categoryId,
                    }),
                  ),
                ),
          )
          as _i4.Future<_i2.Either<_i5.Failure, List<_i7.Product>>>);
}
