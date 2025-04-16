// Mocks generated by Mockito 5.4.5 from annotations
// in flowery/test/features/profile/data/repos/profile_repo_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flowery/features/profile/data/data_source/profile_remote_data_source.dart'
    as _i2;
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

/// A class which mocks [ProfileRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProfileRemoteDataSource extends _i1.Mock
    implements _i2.ProfileRemoteDataSource {
  MockProfileRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<Map<String, dynamic>> changePassword(Map<String, dynamic>? data) =>
      (super.noSuchMethod(
            Invocation.method(#changePassword, [data]),
            returnValue: _i3.Future<Map<String, dynamic>>.value(
              <String, dynamic>{},
            ),
          )
          as _i3.Future<Map<String, dynamic>>);
}
