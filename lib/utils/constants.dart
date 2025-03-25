// Screen name constants
const loginScreenWithData = '/login_screen_with_data';
const dashBoardScreen = '/dashboard_screen';
const loginScreen = '/login_screen';

/// theme types
const themeModeDark = 0;
const themeModeLight = 1;
const themeModeSystem = 2;

//shared preference
const selectedTheme = "selected_theme";

// Hive db constants
const eVitalBox = 'EVitalBox';
const hiveData = 'HiveData';

// Images constants
const eVitalRxLogo = 'assets/images/e_vital_rx.png';

// Validation Regexes
final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');
final RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{9,}$');