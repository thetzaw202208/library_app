///BaseUrl
const String kBaseUrlForHomeScreen = "https://api.nytimes.com";
const String kSearchBaseUrl = "https://www.googleapis.com/books";

///ApiToken
const String kApiKey = "R6rzBgYLcg0ztx64GN4r8WTWoyABGvKR";

///Endpoints
const String kEndPointForHomeScreen = "/svc/books/v3/lists/overview.json";
const String kSearchEndPoint = '/v1/volumes';

///Published Date
DateTime dateTime = DateTime.now();
String monthFormat = (dateTime.month.toString().length) == 2
    ? dateTime.month.toString()
    : '0${dateTime.month.toString()}';
String dayFormat = (dateTime.day.toString().length) == 2
    ? dateTime.day.toString()
    : '0${dateTime.day.toString()}';
String kPublishedDate = '${dateTime.year}-$monthFormat-$dayFormat';

///Query Param
const String kQueryParamsPublishedDate = "published_date";
const String kQueryParamsApiKey = "api-key";
const String kQueryParamQ = 'q';
