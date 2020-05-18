import 'package:americansoda/models/models.dart';
import 'package:americansoda/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:americansoda/bloc/providers/nomenclature/nomenclature.dart';

class NomenclatureBloc extends Bloc<NomenclatureEvent, NomenclatureState> {
  NomenclatureService _nomenclatureService = NomenclatureService();

  @override
  NomenclatureState get initialState => InitialNomenclatureState();

  Stream<NomenclatureState> onLoadNomenclature(LoadNomenclatureEvent event) async* {
    yield LoadingNomenclatureState(
        nomenclature: state.nomenclature,
        products: state.products,
        productTypes: state.productTypes,
        productGroups: state.productGroups,
        pricingPolicy: state.pricingPolicy,
    );

      List<Nomenclature> nomenclature = await _nomenclatureService.loadNomenclature(event.customerId);
      List<PricingPolicy> pricingPolicy = await _nomenclatureService.loadPricingPolicies(event.customerId);
      List<ProductGroup> productGroups = await _nomenclatureService.loadProductGroups(event.customerId);
      List<Product> products = await _nomenclatureService.loadProducts(event.customerId);
      List<ProductType> productTypes = await _nomenclatureService.loadProductTypes(event.customerId);

      yield LoadingSuccessNomenclatureState(
          nomenclature: nomenclature,
          pricingPolicy: pricingPolicy,
          productGroups: productGroups,
          products: products,
          productTypes: productTypes,
      );


  }

  @override
  Stream<NomenclatureState> mapEventToState(NomenclatureEvent event) async* {
    if (event is LoadNomenclatureEvent) {
      yield* onLoadNomenclature(event);
    }
  }
}
