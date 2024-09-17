const String baseUrl = 'http://192.168.66.125:8000';

/////////////////////////////////////headers/////////////////////////////////////

const Map<String, String> BASE_HEADER = {"Accept": "application/json"};

/////////////////////////////////////auth/////////////////////////////////////

const String REGISTER = '$baseUrl/api/register';
const String LOGIN = '$baseUrl/api/login';
const String LOGOUT = '$baseUrl/api/logout';

/////////////////////////////////////account/////////////////////////////////////

const String DELETE_ACCOUNT = '$baseUrl/api/user-delete';
const String CHANGE_PASSWORD = '$baseUrl/api/user-changePassword';

/////////////////////////////////////homepage/////////////////////////////////////

const String HOMEPAGE = '$baseUrl/api/homepage';

/////////////////////////////////////adddesign/////////////////////////////////////

const String CATEGORIES = '$baseUrl/api/categories';
const String COLORS = '$baseUrl/api/colors';
const String SIZES = '$baseUrl/api/sizes';
const String CREATE_DESIGN = '$baseUrl/api/design-create';
