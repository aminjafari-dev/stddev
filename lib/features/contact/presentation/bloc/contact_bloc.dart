import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:std_dev_task/core/network/event_status.dart';
import 'package:std_dev_task/features/contact/domain/usecases/get_contacts_usecase.dart';

import '../../../../core/network/data_status.dart';
import '../../domain/entities/contact_entity.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetContactsUsecase contactsUsecase;
  ContactBloc(
    this.contactsUsecase,
  ) : super(ContactState(contactList: EventLoading())) {
    on<GetContacts>((event, emit) async {
      emit(state.copyWith(contactList: EventLoading()));
      DataSatus<List<ContactEntity>> result = await contactsUsecase.call();
      if (result is DataSuccess) {
       return emit(state.copyWith(contactList: EventCompleted(result.data!)));
      }
      if (result is DataFailed) {
       return emit(state.copyWith(contactList: EventError(result.error!)));
      }
    });
  }
}
