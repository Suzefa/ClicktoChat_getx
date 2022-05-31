
import 'dart:io';

const String kSplashScreenRoute ='/SplashScreen';
const String kHomeScreenRoute ='/HomeScreen';
const String kStatusScreenRoute='/StatusScreen';
const String kCustomScaffoldRoute = '/CustomScaffold';
const String kImageViewerScreenRoute = '/ImageViewerScreen';
const String kVideoPlayerScreenRoute = '/VideoPlayerScreen';


const String kBackgroundImageAddress='assets/logo/bg.jpg';
const String kLogoAddress='assets/logo/app_logo.png';
const String kLogoTransparentAddress='assets/logo/app_logo_transparent.png';

const String kInternalStorageBaseLocation='/storage/emulated/0';
const String kLocalOldWAMediaStorage='/WhatsApp/Media/.Statuses/';
const String kLocalNewWAMediaStorage='/Android/media/com.whatsapp/WhatsApp/Media/.Statuses/';
const String kAppMediaDirectoryPath=kInternalStorageBaseLocation+'/ClickToChat/.appPrivateData';
const String kTempDataDirectoryPath=kInternalStorageBaseLocation+'/ClickToChat/.tempData';
const String kStatusPhotoDirectoryPath=kInternalStorageBaseLocation+'/ClickToChat/Photos';
const String kStatusVideoDirectoryPath=kInternalStorageBaseLocation+'/ClickToChat/Videos';

const String kPermissionSessionStoreToken = 'PermissionSession';

final Directory kAppMainDirectory = Directory(kInternalStorageBaseLocation+'/ClickToChat');
final Directory kAppMediaDirectory = Directory(kAppMediaDirectoryPath);
final Directory kAppTempDataDirectory = Directory(kTempDataDirectoryPath);
final Directory kAppPhotosDataDirectory = Directory(kStatusPhotoDirectoryPath);
final Directory kAppVideosDataDirectory = Directory(kStatusVideoDirectoryPath);