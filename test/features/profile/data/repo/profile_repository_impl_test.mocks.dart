// Mocks generated by Mockito 5.4.5 from annotations
// in flowery/test/features/profile/data/repo/profile_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flowery/features/profile/data/model/user_response.dart' as _i2;
import 'package:flowery/features/profile/domain/repos/profile_data_source_contract%20.dart'
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

class _FakeUserData_0 extends _i1.SmartFake implements _i2.UserData {
  _FakeUserData_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [ProfileRemoteDataSourceContract].
///
/// See the documentation for Mockito's code generation for more information.
class MockProfileRemoteDataSourceContract extends _i1.Mock
    implements _i3.ProfileRemoteDataSourceContract {
  MockProfileRemoteDataSourceContract() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.UserData> getLoggedInUserData() =>
      (super.noSuchMethod(
            Invocation.method(#getLoggedInUserData, []),
            returnValue: _i4.Future<_i2.UserData>.value(
              _FakeUserData_0(
                this,
                Invocation.method(#getLoggedInUserData, []),
              ),
            ),
          )
          as _i4.Future<_i2.UserData>);
}
