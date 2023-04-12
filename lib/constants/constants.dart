//*validators
// ignore_for_file: constant_identifier_names

const emailRegex =
    r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
const passRegex = r'([A-Za-z0-9]{3,})\w+';
const nameRegex = r"^[a-zA-Z]{2,30}$";
const phoneRegEx = r'^(0|6|7|1)[0-9]{8,9}$';

const TOKEN = "TOKEN";
const SAVEDUSER = "SAVEDUSER";
const SAVEDAGENT = "SAVEDAGENT";
const DEVICEID = "DEVICEID";

const SERVER_FAILURE_MESSAGE = "Server error please try again";
const NETWORK_FAILURE_MESSAGE = "Please activate your internet";
const SOCKET_FAILURE_MESSAGE = "Seems you internet connection ran out";
const CACHE_FAILURE_MESSAGE = "Could not access records";
const INPUT_FAILURE_MESSAGE = "Input Failure";
const SELECT_FROM_PHONE_FAILURE_MESSAGE = "Something went wrong with the file";
const SELECT_FROM_GALLERY_FAILURE_MESSAGE = "Couldnt pick image from gallery";
const SELECT_FAIL_FAILURE_MESSAGE = "You did not pick an file";
const PERMISSION_FAILURE_MESSAGE =
    "Please enable locations for app in settings";

const LOCATION_REQUEST_FAILURE_MESSAGE = "Please enable location pick up";

const PERMISSION_NEVER_ASKED_FAILURE_MESSAGE =
    "Error in asking location permissions, Please try agai";
const ACCOUNT_FAILURE_MESSAGE = "Could not create an account";
const UNAUTHENTICATED_FAILURE_MESSAGE =
    "You are unauthenticated, you will be logged out";
const SERVER_MAINTAINCE_FAILURE_MESSAGE = "Service maintenance failed";
const LANGUAGE_FAILURE_MESSAGE = "Could not fetch locale";
const FORBIDDEN_MESSAGE = "Access to the requested resource is forbidden";
const NOT_FOUND_MESSAGE = "Could not find item";

const SELECT_IMAGE_FAILURE_MESSAGE = "You did not pick an image";
const SELECT_FROM_CAMERA_FAILURE_MESSAGE =
    "Something went wrong with the camera";
const SELECT_IMAGE_PERMISSION_FAILURE_MESSAGE =
    "Please enable camera and gallery permissions on your device";
const DATABASE_FAILURE = "Database Failure";
const LOCATION_ERROR = "Failed to fetch location services";

const MAP_STYLE =
    "[{\"featureType\":\"all\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"weight\":\"2.00\"}]},{\"featureType\":\"all\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#9c9c9c\"}]},{\"featureType\":\"all\",\"elementType\":\"labels.text\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"landscape\",\"elementType\":\"all\",\"stylers\":[{\"color\":\"#f2f2f2\"}]},{\"featureType\":\"landscape\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"landscape.man_made\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"poi\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"road\",\"elementType\":\"all\",\"stylers\":[{\"saturation\":-100},{\"lightness\":45}]},{\"featureType\":\"road\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#eeeeee\"}]},{\"featureType\":\"road\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#7b7b7b\"}]},{\"featureType\":\"road\",\"elementType\":\"labels.text.stroke\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"simplified\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"labels.icon\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"transit\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"water\",\"elementType\":\"all\",\"stylers\":[{\"color\":\"#46bcec\"},{\"visibility\":\"on\"}]},{\"featureType\":\"water\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#c8d7d4\"}]},{\"featureType\":\"water\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#070707\"}]},{\"featureType\":\"water\",\"elementType\":\"labels.text.stroke\",\"stylers\":[{\"color\":\"#ffffff\"}]}]";

const GENDERS = [
  {"label": 'Male', "value": "male"},
  {"label": 'Female', "value": "female"},
  {"label": 'Other', "value": "other"},
];
