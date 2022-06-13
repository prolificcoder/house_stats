class HouseAPI {
  //Mock server created through postman
  static const String _apiBaseUrl =
      '0e33edf5-6cdc-4500-9984-f7152c62c56c.mock.pstmn.io';
  static const String _getAll = '/api/all';

  Uri getAllHousesRoute = Uri(
    scheme: 'https',
    host: _apiBaseUrl,
    path: _getAll,
  );
}
