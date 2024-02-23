import '../modal/model.dart';
import '../data/provider.dart';

class ShowRepository {
  final ApiProvider apiProvider;
  ShowRepository(this.apiProvider);
  Future<TvShowModel> getTvShow(String page) => apiProvider.getTVShow(page);
}
