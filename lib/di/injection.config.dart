// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:finance/bloc/user_cubit.dart' as _i11;
import 'package:finance/data_source/api_remote.dart' as _i8;
import 'package:finance/data_source/api_source.dart' as _i7;
import 'package:finance/di/app.module.dart' as _i12;
import 'package:finance/network/handle_network_call.dart' as _i4;
import 'package:finance/network/headers_interceptor.dart' as _i5;
import 'package:finance/repo_source/api_repository.dart' as _i9;
import 'package:finance/repo_source/api_repository_implement.dart' as _i10;
import 'package:finance/repo_source/local/local_resource.dart' as _i6;
import 'package:finance/routes/routes.gr.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.AppRouter>(() => appModule.appRouter);
    gh.lazySingleton<_i4.HandleNetworkCall>(() => _i4.HandleNetworkCall());
    gh.lazySingleton<_i5.HeadersInterceptors>(() => _i5.HeadersInterceptors(
        handleNetworkCall: gh<_i4.HandleNetworkCall>()));
    gh.factory<_i6.LocalStorageManager>(() => appModule.localstorage);
    gh.lazySingleton<_i7.ApiSource>(() =>
        _i7.ApiSourceImpl(headersInterceptors: gh<_i5.HeadersInterceptors>()));
    gh.lazySingleton<_i8.RemoteSource>(() => _i8.RemoteSourceImpl(
          networkCall: gh<_i4.HandleNetworkCall>(),
          apiSource: gh<_i7.ApiSource>(),
          localStorageManager: gh<_i6.LocalStorageManager>(),
        ));
    gh.lazySingleton<_i9.ApiRepository>(() => _i10.ApiRepositoryImpl(
          networkCall: gh<_i4.HandleNetworkCall>(),
          remoteSource: gh<_i8.RemoteSource>(),
        ));
    gh.factory<_i11.AuthCubit>(
        () => _i11.AuthCubit(repository: gh<_i9.ApiRepository>()));
    return this;
  }
}

class _$AppModule extends _i12.AppModule {}
