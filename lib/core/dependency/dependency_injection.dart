import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:std_dev_task/core/widgets/sized_box.dart';
import 'package:std_dev_task/features/contact/data/datasources/contact_api_provider.dart';
import 'package:std_dev_task/features/contact/data/repositories/contact_repository_lmpl.dart';
import 'package:std_dev_task/features/contact/domain/repositories/contact_repository.dart';
import 'package:std_dev_task/features/contact/domain/usecases/create_contacts_usecase.dart';
import 'package:std_dev_task/features/contact/domain/usecases/delete_contact.dart';
import 'package:std_dev_task/features/contact/domain/usecases/get_contacts_usecase.dart';
import 'package:std_dev_task/features/contact/presentation/bloc/contact_bloc.dart';

GetIt locator = GetIt.instance();
setup() {
  locator.registerSingleton(STDSizedBox());

  // api providers
  locator.registerSingleton<ContactApiProvider>(ContactApiProvider());

  // repositories
  locator
      .registerSingleton<ContactRepository>(ContactRepositoryImpl(locator()));

  // usecases
  locator.registerSingleton<GetContactsUsecase>(GetContactsUsecase(locator()));
  locator.registerSingleton<AddContactUsecase>(AddContactUsecase(locator()));
  locator
      .registerSingleton<DeleteContactUsecase>(DeleteContactUsecase(locator()));
  // state managements
  locator.registerSingleton<ContactBloc>(ContactBloc(
    locator(),
    locator(),
    locator(),
  ));
}
