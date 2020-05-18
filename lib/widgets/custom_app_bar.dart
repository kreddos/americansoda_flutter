import 'package:americansoda/bloc/providers/providers.dart';
import 'package:americansoda/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String leftValue = 'one';
  String rightValue = 'two';

  onChangedCustomer(Customer customer) {
    context.bloc<CustomerBloc>().add(SetCustomerEvent(customer: customer));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, customerState) {
                if (state is LoadingProfileSuccessState && customerState?.data?.id != null) {
                  return Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: DropdownButton<int>(
                            isExpanded: true,
                            value: state.data.customers.indexWhere((element) => element.id == customerState.data.id),
                            dropdownColor: Theme.of(context).primaryColor,
                            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                            style: TextStyle(color: Colors.white),
                            underline: Container(height: 0),
                            elevation: 12,
                            onChanged: (index) => onChangedCustomer(state.data.customers[index]),
                            items: state.data.customers.asMap().entries
                                .map((item) => DropdownMenuItem<int>(
                                value: item.key, child: Text(item.value.name.toUpperCase())))
                                .toList()),
                      ),
                    ),
                  );
                }

                if (state is LoadingProfileState) {
                  return Container(
                    child: Text(
                      'Loading...',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return Container();
              },
            );
          },
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: DropdownButton<String>(
                  value: rightValue,
                  dropdownColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                  style: TextStyle(color: Colors.white),
                  underline: Container(height: 0),
                  elevation: 12,
                  onChanged: (value) {},
                  items: <String>['one', 'two', 'three']
                      .map((String value) => DropdownMenuItem<String>(
                          value: value, child: Text(value.toUpperCase())))
                      .toList()),
            ),
          ),
        )
      ],
    );
  }
}
