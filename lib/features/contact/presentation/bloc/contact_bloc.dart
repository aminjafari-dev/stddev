import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:std_dev_task/core/network/event_status.dart';
import 'package:std_dev_task/features/contact/domain/usecases/get_contacts_usecase.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetContactsUsecase contactsUsecase;
  ContactBloc(
     this.contactsUsecase,
  ) : super(ContactState(contactList: EventLoading())) {
    on<GetContacts>((event, emit) async {
      emit(state.copyWith(contactList: EventLoading()));

      var result = await contactsUsecase.call();
      emit(state.copyWith(contactList: EventCompleted(result)));
    });
  }
}
