import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:std_dev_task/core/network/event_status.dart';
import 'package:std_dev_task/features/contact/domain/usecases/create_contacts_usecase.dart';
import 'package:std_dev_task/features/contact/domain/usecases/delete_contact.dart';
import 'package:std_dev_task/features/contact/domain/usecases/get_contacts_usecase.dart';

import '../../../../core/network/data_status.dart';
import '../../domain/entities/contact_entity.dart';

part 'contact_event.dart';
part 'contact_state.dart';

// BLoC for managing contact-related operations
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetContactsUsecase contactsUsecase;
  final AddContactUsecase addContactUsecase;
  final DeleteContactUsecase deleteContactUsecase;

  ContactBloc(
      this.contactsUsecase, this.addContactUsecase, this.deleteContactUsecase)
      : super(
          ContactState(
            contactList: EventInitial(),
            addContact: EventInitial(),
            deleteContact: EventInitial(),
          ),
        ) {
    on<GetContactsEvent>((event, emit) async {
      emit(state.copyWith(contactList: EventLoading()));
      DataStatus<List<ContactEntity>> result = await contactsUsecase.call();
      if (result is DataSuccess) {
        emit(state.copyWith(contactList: EventCompleted(result.data!)));
      } else if (result is DataFailed) {
        emit(state.copyWith(contactList: EventError(result.error!)));
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
          // Fetch updated contact list after adding a new contact
          emit(state.copyWith(contactList: EventLoading()));
          DataStatus<List<ContactEntity>> contactListResult =
              await contactsUsecase.call();

          if (contactListResult is DataSuccess) {
            emit(state.copyWith(
                contactList: EventCompleted(contactListResult.data!)));
          } else if (contactListResult is DataFailed) {
            emit(state.copyWith(
                contactList: EventError(contactListResult.error!)));
          }
          emit(state.copyWith(addContact: EventCompleted(result.data!)));
        } else if (result is DataFailed) {
          emit(state.copyWith(addContact: EventError(result.error!)));
        }
      },
    );

    on<DeleteContactEvent>(
      (event, emit) async {
        emit(state.copyWith(deleteContact: EventLoading()));
        var result = await deleteContactUsecase.call(event.id);

        if (result is DataSuccess) {
          // Fetch updated contact list after deleting a contact
          DataStatus<List<ContactEntity>> contactListResult =
              await contactsUsecase.call();

          if (contactListResult is DataSuccess) {
            emit(state.copyWith(
                contactList: EventCompleted(contactListResult.data!)));
          } else if (contactListResult is DataFailed) {
            emit(state.copyWith(
                contactList: EventError(contactListResult.error!)));
          }
          emit(state.copyWith(deleteContact: EventCompleted(result.data!)));
        } else if (result is DataFailed) {
          emit(state.copyWith(deleteContact: EventError(result.error!)));
        }
      },
    );
  }
}
