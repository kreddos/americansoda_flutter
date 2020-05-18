import 'package:americansoda/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class CustomerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialCustomerEvent extends CustomerEvent {
  final List<Customer> data;
  InitialCustomerEvent(this.data);

  @override
  List<Object> get props => [data];
}

class SetCustomerEvent extends CustomerEvent{
  final Customer customer;
  SetCustomerEvent({ this.customer });

  @override
  List<Object> get props => [customer];
}
