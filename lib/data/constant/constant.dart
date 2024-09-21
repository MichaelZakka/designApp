const String baseUrl = 'http://192.168.64.125:8000';
const String baseImageUrl = 'http://192.168.64.125:8000/storage/';

/////////////////////////////////////headers/////////////////////////////////////

const Map<String, String> BASE_HEADER = {"Accept": "application/json"};

/////////////////////////////////////auth/////////////////////////////////////

const String REGISTER = '$baseUrl/api/register';
const String LOGIN = '$baseUrl/api/login';
const String LOGOUT = '$baseUrl/api/logout';

/////////////////////////////////////account/////////////////////////////////////

const String DELETE_ACCOUNT = '$baseUrl/api/user-delete';
const String CHANGE_PASSWORD = '$baseUrl/api/user-changePassword';
const String UPDATE_ACCOUNT = '$baseUrl/api/user-update';
const String USER_INFO = '$baseUrl/api/user-info';

/////////////////////////////////////homepage/////////////////////////////////////

const String HOMEPAGE = '$baseUrl/api/homepage';

/////////////////////////////////////adddesign/////////////////////////////////////

const String CATEGORIES = '$baseUrl/api/categories';
const String COLORS = '$baseUrl/api/colors';
const String SIZES = '$baseUrl/api/sizes';
const String CREATE_DESIGN = '$baseUrl/api/design-create';

/////////////////////////////////////admin/////////////////////////////////////

const String GET_PENDING_REQUESTS = '$baseUrl/api/admin/pending-designs';
const String REJECT_DESIGN = '$baseUrl/api/admin/reject-design';
const String ACCEPT_DESIGN = '$baseUrl/api/admin/accept-design';

/////////////////////////////////////design/////////////////////////////////////

const String GET_DESIGN = '$baseUrl/api/design';

/////////////////////////////////////design/////////////////////////////////////

const String ORDER = '$baseUrl/api/order';

/////////////////////////////////////search/////////////////////////////////////

const String SEARCH = '$baseUrl/api/design-search';

/////////////////////////////////////review/////////////////////////////////////
const String REVIEW = '$baseUrl/api/design-review';