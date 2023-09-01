import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:std_dev_task/core/network/event_status.dart';
import 'package:std_dev_task/features/contact/domain/usecases/create_contacts_usecase.dart';
import 'package:std_dev_task/features/contact/domain/usecases/get_contacts_usecase.dart';

import '../../../../core/network/data_status.dart';
import '../../domain/entities/contact_entity.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetContactsUsecase contactsUsecase;
  final AddContactUsecase addContactUsecase;
  ContactBloc(this.contactsUsecase, this.addContactUsecase)
      : super(ContactState(
            contactList: EventInitial(), addContact: EventInitial())) {
    on<GetContactsEvent>((event, emit) async {
      emit(state.copyWith(contactList: EventLoading()));
      DataSatus<List<ContactEntity>> result = await contactsUsecase.call();
      if (result is DataSuccess) {
        return emit(state.copyWith(contactList: EventCompleted(result.data!)));
      }
      if (result is DataFailed) {
        return emit(state.copyWith(contactList: EventError(result.error!)));
      }
    });

    on<AddContactEvent>(
      (event, emit) async {
        emit(state.copyWith(addContact: EventLoading()));
        var result = await addContactUsecase.call(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          phone: event.phone,
          note: event.note,
        );
        if (result is DataSuccess) {
          return emit(state.copyWith(addContact: EventCompleted(result.data!)));
        }
        if (result is DataFailed) {
          return emit(state.copyWith(addContact: EventError(result.error!)));
        }
      },
    );
  }
}
