import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:std_dev_task/features/contact/domain/usecases/get_contacts_usecase.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetContactsUsecase contactsUsecase;
  ContactBloc({
    required this.contactsUsecase,
  }) : super(ContactInitial()) {
    on<ContactEvent>((event, emit) {});
  }
}
