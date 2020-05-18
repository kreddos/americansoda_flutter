import 'package:americansoda/bloc/providers/customer/customer.dart';
import 'package:americansoda/bloc/providers/providers.dart';
import 'package:americansoda/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final BannersBloc bannersBloc;
  final NomenclatureBloc nomenclatureBloc;
  CustomerBloc({ this.bannersBloc, this.nomenclatureBloc });

  @override
  CustomerState get initialState => CustomerState();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _clientCustomerIdKey = 'clientCustomerId';

  Stream<CustomerState> onSetCustomer(SetCustomerEvent event) async* {
    SharedPreferences prefs = await _prefs;
    await prefs.setInt(_clientCustomerIdKey, event.customer.id);

    yield CustomerState(data: event.customer);

    bannersBloc.add(LoadBannersEvent(customerId: event.customer.id));
    nomenclatureBloc.add(LoadNomenclatureEvent(customerId: event.customer.id));
  }


  Stream<CustomerState> onInitial(InitialCustomerEvent event) async* {
    SharedPreferences prefs = await _prefs;
    int currentCustomerId = prefs.getInt(_clientCustomerIdKey);

    Customer customer;

    if (currentCustomerId != null) {
      customer = event.data.firstWhere((element) => element.id == currentCustomerId, orElse: () => null);
    }

    if (customer == null) {
      customer = event.data.first;
    }

    await prefs.setInt('clientCustomerId', customer.id);

    add(SetCustomerEvent(customer: customer));
  }

  @override
  Stream<CustomerState> mapEventToState(CustomerEvent event) async* {
    if (event is SetCustomerEvent) {
      yield* onSetCustomer(event);
    }

    if (event is InitialCustomerEvent) {
      yield* onInitial(event);
    }
  }
}