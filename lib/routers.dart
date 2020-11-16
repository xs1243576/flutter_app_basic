import 'package:flutter/material.dart';
import 'widgets/indexOne.dart';
import 'widgetsplugins/index.dart';
import 'routes/index.dart';
import 'widgetsexample/index.dart';

///
/// des:
///

Map<String, WidgetBuilder> routers = {
  // "mxflutterApp": (context) {
  //   return new mxflutterApp();
  // },
  "_TransitionsHomePage  animations动画实例": (context) {
    return new TransitionsHomePage(); // _TransitionsHomePage  类的名字一般不用下划线
    // The constructor returns type 'dynamic' that isn't of expected type 'Widget'.
    // The name '_TransitionsHomePage' isn't a class.  Try correcting the name to match an existing class.
  },
  "SimpleAnimationsExampleApp": (context) {
    return new SimpleAnimationsExampleApp();
  },
  "FlutterBlueApp": (context) {
    return new FlutterBlueApp();
  },
  "intro_views_flutterApp": (context) {
    return new intro_views_flutterApp();
  },
  "liquid_progress_indicatorApp": (context) {
    return new liquid_progress_indicatorApp();
  },
  "modal_progress_hudApp": (context) {
    return new modal_progress_hudApp();
  },
  "progress_state_buttonApp": (context) {
    return new progress_state_buttonApp();
  },
  "progress_buttonPage": (context) {
    return new progress_buttonPage();
  },
  "passcode_screenApp": (context) {
    return new passcode_screenApp();
  },
  "infinite_listviewApp  上下无限滑动": (context) {
    return new infinite_listviewApp();
  },
  "snaplistApp": (context) {
    return new snaplistApp();
  },
  "flutter_fluid_sliderApp": (context) {
    return new flutter_fluid_sliderApp();
  },
  "flutter_tagsApp": (context) {
    return new flutter_tagsApp();
  },
  "AnimatedTextKitApp": (context) {
    return new AnimatedTextKitApp();
  },
  "liquid_pull_to_refreshApp": (context) {
    return new liquid_pull_to_refreshApp();
  },
  "FlutterPlatformWidgetsMain": (context) {
    return new FlutterPlatformWidgetsMain();
  },
//  "FlutterUnityWidgetApp": (context) {
//    return new FlutterUnityWidgetApp();
//  },
  "FancyBottomNavigationApp": (context) {
    return new FancyBottomNavigationApp();
  },
  "AnimatedSplashScreenApp": (context) {
    return new AnimatedSplashScreenApp();
  },
  "FlameSplashScreenApp": (context) {
    return new FlameSplashScreenApp();
  },
  "FlutterSplashScreenApp": (context) {
    return new FlutterSplashScreenApp();
  },
  "FlareSplashScreenApp": (context) {
    return new FlareSplashScreenApp();
  },
  "FlutterSpeedDialApp": (context) {
    return new FlutterSpeedDialApp();
  },
  "ExpandableApp": (context) {
    return new ExpandableApp();
  },
  "FlutterAudioRecorderApp": (context) {
    return new FlutterAudioRecorderApp();
  },
  "LikeButtonApp": (context) {
    return new LikeButtonApp();
  },
  "FlutterCalendarCarouselApp": (context) {
    return new FlutterCalendarCarouselApp();
  },
  "BackdropApp": (context) {
    return new BackdropApp();
  },
  "WechatCameraPickerApp": (context) {
    return new WechatCameraPickerApp();
  },
  "SyncfusionFlutterDatepickerApp": (context) {
    return new SyncfusionFlutterDatepickerApp();
  },
  "SlidersApp": (context) {
    return new SlidersApp();
  },
  "TransformerPageViewApp": (context) {
    return new TransformerPageViewApp();
  },
  "GetApp": (context) {
    return new GetApp();
  },
  "LazyIndexedStackApp": (context) {
    return new LazyIndexedStackApp();
  },
  "SmoothPageIndicatorPage": (context) {
    return new SmoothPageIndicatorPage();
  },
  "ScrollingPageIndicatorApp": (context) {
    return new ScrollingPageIndicatorApp();
  },
  "DropdownSearchApp": (context) {
    return new DropdownSearchApp();
  },
  "DropdownBannerApp": (context) {
    return new DropdownBannerApp();
  },
  "FlutterDropdownApp": (context) {
    return new FlutterDropdownApp();
  },
  "SearchableDropdownApp": (context) {
    return new SearchableDropdownApp();
  },
  "DropdownMenuApp": (context) {
    return new DropdownMenuApp();
  },
  "HorizontalCalendarApp": (context) {
    return new HorizontalCalendarApp();
  },
  "CalendarApp": (context) {
    return new CalendarApp();
  },
  "MarqueeApp": (context) {
    return new MarqueeApp();
  },
  "DeviceInfoApp": (context) {
    return new DeviceInfoApp();
  },
  "FlutterMMkvApp": (context) {
    return new FlutterMMkvApp();
  },
  "MMkvFlutterApp": (context) {
    return new MMkvFlutterApp();
  },
  "CurvedNavigationBarBottomNavBar": (context) {
    return new CurvedNavigationBarBottomNavBar();
  },
  "MiniCalendarApp": (context) {
    return new MiniCalendarApp();
  },
  "PagingApp": (context) {
    return new PagingApp();
  },
  "RatingBarApp": (context) {
    return new RatingBarApp();
  },
  "NeeKoApp": (context) {
    return new NeeKoApp();
  },
  "LoadMoreApp": (context) {
    return new LoadMoreApp();
  },
  "FlutterPageIndicatorApp": (context) {
    return new FlutterPageIndicatorApp();
  },
  "PageIndicatorApp": (context) {
    return new PageIndicatorApp();
  },
  "GesturePasswordApp": (context) {
    return new GesturePasswordApp();
  },
  "ImageGallerySaverApp": (context) {
    return new ImageGallerySaverApp();
  },
  "GallerySaverApp": (context) {
    return new GallerySaverApp();
  },
  "OverlaySupportApp": (context) {
    return new OverlaySupportApp();
  },
//  "FlutterBoostApp": (context) {
//    return new FlutterBoostApp();
//  },
  "FlustarsApp": (context) {
    return new FlustarsApp();
  },
  "MultiImagePickerApp": (context) {
    return new MultiImagePickerApp();
  },
//  "FlutterStatusbarManagerApp": (context) {
//    return new FlutterStatusbarManagerApp();
//  },
  "FlutterStatusbarcolorApp": (context) {
    return new FlutterStatusbarcolorApp();
  },
  "flutter_hooks  HooksGalleryApp use_effect use_state use_stream": (context) {
    return new HooksGalleryApp();
  },
//  "StackedApp": (context) {
//    return new StackedApp();
//  },
  "StickyHeaderApp": (context) {
    return new StickyHeaderApp();
  },
  "fluro  AppComponent": (context) {
    return new AppComponent();
  },
  "ChewieDemo": (context) {
    return new ChewieDemo();
  },
  "FlukitApp": (context) {
    return new FlukitApp();
  },
  "ParallaxImageApp": (context) {
    return new ParallaxImageApp();
  },
  "CarouselPage": (context) {
    return new CarouselPage();
  },
  "NotifyPage": (context) {
    return new NotifyPage();
  },
  "ShareApp": (context) {
    return new ShareApp();
  },
//  "TobiasApp Tobias是一个为支付宝支付SDK做的Flutter插件": (context) {
//    return new TobiasApp();
//  },
  "DragAbleGridViewDemo 可拖拽GridView": (context) {
    return new DragAbleGridViewDemo();
  },
  "CityPickers": (context) {
    return new CityPickersApp();
  },
  "AzlistviewApp": (context) {
    return new AzlistviewApp();
  },
  "FilePickerDemo": (context) {
    return new FilePickerDemo();
  },
  "FlutterAppBadgerApp app图标右上角角标": (context) {
    return new FlutterAppBadgerApp();
  },
  "BadgesApp 数量角标": (context) {
    return new BadgesApp();
  },
  "EasyRefreshApp ": (context) {
    return new EasyRefreshApp();
  },
  "login": (context) {
    return new LoginRoute();
  },
  "themes": (context) {
    return new ThemeChangeRoute();
  },
  "language": (context) {
    return new LanguageRoute();
  },
  "camera 相机": (context) {
    return new CameraApp();
  },
  "PickerImage 选择图片": (context) {
    return new PickerImage();
  },
  "PathProviderApp": (context) {
    return new PathProviderApp();
  },
  "VideoPlayerApp": (context) {
    return new VideoPlayerApp();
  },
  "CachedNetworkImageApp": (context) {
    return new CachedNetworkImageApp();
  },
  "ImageCropperApp": (context) {
    return new ImageCropperApp();
  },
  "ChannelTestPage": (context) {
    return new ChannelTestPage();
  },
  "HtmlTextview": (context) {
    return new HtmlTextviewApp();
  },
  "markdown": (context) {
    return new MarkDownApp();
  },
  "Html2md": (context) {
    return new Html2mdApp();
  },
  "PlatformAwareApp": (context) {
    return new PlatformAwareApp();
  },
  "NativeWidgetsApp": (context) {
    return new NativeWidgetsApp();
  },
  "CalendarViewApp": (context) {
    return new CalendarViewApp();
  },
  "CalendarroDemoApp": (context) {
    return new CalendarroDemoApp();
  },
  "FlutterPickerApp": (context) {
    return new FlutterPickerApp();
  },
  "FlutterDatetimePickerApp": (context) {
    return new FlutterDatetimePickerApp();
  },
  "FlutterColorPickerApp": (context) {
    return new FlutterColorPickerApp();
  },
  "WebViewExample": (context) {
    return new WebViewExample();
  },
  "WebViewApp": (context) {
    return new WebViewApp();
  },
  "WebViewDemo2Page": (context) {
    return new WebViewDemo2Page();
  },
  "WebviewPluginApp": (context) {
    return new WebviewPluginApp();
  },
  "GalleryApp charts_flutter比较好用": (context) {
    return new GalleryApp();
  },
  "syncfusion_flutter_charts": (context) {
    return new ChartApp();
  },
  "FlutterEchartsApp": (context) {
    return new FlutterEchartsApp();
  },
  "FlChartApp": (context) {
    return new FlChartApp();
  },
  "FlutterSvgApp": (context) {
    return new FlutterSvgApp();
  },
  "_BarcodeScanApp": (context) {
    return new BarcodeScanApp();
  },
  "FlutterBarcodeScannerApp": (context) {
    return new FlutterBarcodeScannerApp();
  },
  "FlutterQrReaderApp": (context) {
    return new FlutterQrReaderApp();
  },
//  "QrFlutterApp": (context) {
//    return new QrFlutterApp();
//  },
  "PermissionHandlerApp": (context) {
    return new PermissionHandlerApp();
  },
//  "SimplePermissionsApp": (context) {
//    return new SimplePermissionsApp();
//  },
  "FlutterRatingBarApp 星级评分": (context) {
    return new FlutterRatingBarApp();
  },
//  "FluterBlocApp": (context) {
//    return new FluterBlocApp();
//  },
  "FlutterSlidableApp 左右滑动按钮": (context) {
    return new FlutterSlidableApp();
  },
  "FlutterScreenutilApp": (context) {
    return new FlutterScreenutilApp();
  },
  "GradientButtonPage 按钮颜色渐变": (context) {
    return new GradientButtonPage();
  },
  "FlutterSwiperApp": (context) {
    return new FlutterSwiperApp();
  },
//  "AmapLocationFluttifyApp": (context) {
//    return new AmapLocationFluttifyApp();
//  },
  "MapLocationPage 地图定位组件": (context) {
    return new MapLocationPage();
  },
  "AmapAllFluttifyApp": (context) {
    return new AmapAllFluttifyApp();
  },
  "AmapMapFluttifyApp": (context) {
    return new AmapMapFluttifyApp();
  },
  "AmapLocationFluttifyApp": (context) {
    return new AmapLocationFluttifyApp();
  },
  "GeolocatorExampleApp": (context) {
    return new GeolocatorExampleApp();
  },
//  "LocationApp": (context) {
//    return new LocationApp();
//  },
  "FlutterStaggeredGridViewApp": (context) {
    return new FlutterStaggeredGridViewApp();
  },
  "FlutterStaggeredAnimationspp": (context) {
    return new FlutterStaggeredAnimationspp();
  },
  "CarouselDemo 轮播滑动插件": (context) {
    return new CarouselDemo();
  },
  "AutoSizeTextApp": (context) {
    return new AutoSizeTextApp();
  },
  "GetItApp": (context) {
    return new GetItApp();
  },
  "StyledWidget": (context) {
    return new StyledWidget();
  },
  "ShimmerApp 内容显示前的加载效果": (context) {
    return new ShimmerApp();
  },
  "FlutterCacheManagerApp": (context) {
    return new FlutterCacheManagerApp();
  },
  "LocalStorageApp": (context) {
    return new LocalStorageApp();
  },
  "AndroidIntentApp": (context) {
    return new AndroidIntentApp();
  },
//  "AlarmManagerExampleApp": (context) {
//    return new AlarmManagerExampleApp();
//  },
  "FlutterFullPdfViewerApp": (context) {
    return new FlutterFullPdfViewerApp();
  },
  "FlutterBlurhashApp": (context) {
    return new FlutterBlurhashApp();
  },
  "GiffyDialogApp": (context) {
    return new GiffyDialogApp();
  },
  "SearchWidgetApp": (context) {
    return new SearchWidgetApp();
  },
  "FlappySearchBarApp": (context) {
    return new FlappySearchBarApp();
  },
  "AvatarGlowApp": (context) {
    return new AvatarGlowApp();
  },
  "GoogleFontsApp": (context) {
    return new GoogleFontsApp();
  },
  "FontAwesomeGalleryApp": (context) {
    return new FontAwesomeGalleryApp();
  },
  "FlutterJsonWidgetApp": (context) {
    return new FlutterJsonWidgetApp();
  },
  "DynamicWidgetApp": (context) {
    return new DynamicWidgetApp();
  },
  "JsonTableApp": (context) {
    return new JsonTableApp();
  },
  "IntroSliderApp": (context) {
    return new IntroSliderApp();
  },
  "PhotoViewApp": (context) {
    return new PhotoViewApp();
  },
  "TableCalendarApp": (context) {
    return new TableCalendarApp();
  },
  "FlutterIconsApp": (context) {
    return new FlutterIconsApp();
  },
//  "SensorsApp": (context) {
//    return new SensorsApp();
//  },
  "ProgressDialogPage": (context) {
    return new ProgressDialogPage();
  },
  "FlutterSpinkit": (context) {
    return new FlutterSpinkitApp();
  },
  "dots_indicator": (context) {
    return new DotsIndicatorApp();
  },
  "StatesRebuilderApp": (context) {
    return new StatesRebuilderApp();
  },
  "VelocityXApp": (context) {
    return new VelocityXApp();
  },
  "FlushBarApp 很友好的弹出框": (context) {
    return new FlushBarApp();
  },
  "ResponsiveBuilderApp": (context) {
    return new ResponsiveBuilderApp();
  },
  "PrintingApp": (context) {
    return new PrintingApp();
  },
  "IntroductionScreenApp": (context) {
    return new IntroductionScreenApp();
  },
  "DottedBorderApp": (context) {
    return new DottedBorderApp();
  },
  "AwesomeDialogApp  很友好的弹出框": (context) {
    return new AwesomeDialogApp();
  },
  "AnimatedSplashApp 闪屏过渡界面": (context) {
    return new AnimatedSplashApp();
  },
  "FlutterDownloaderApp 各种文件下载功能": (context) {
    return new FlutterDownloaderApp();
  },
  "GroupedListApp": (context) {
    return new GroupedListApp();
  },
  "SlidingSheetPage": (context) {
    return new SlidingSheetApp();
  },
//  "ConvexBottomBarPage": (context) {
//    return new ConvexBottomBarPage();
//  },
  "ExpandableBottomBar": (context) {
    return new ExpandableBottomBar();
  },
  "BottomNavyBarApp": (context) {
    return new BottomNavyBarApp();
  },
  "SpincircleBottomBarApp": (context) {
    return new SpincircleBottomBarApp();
  },
  "BubbleBottomBarApp": (context) {
    return new BubbleBottomBarApp();
  },
  "ScrollBottomNavigationBarApp": (context) {
    return new ScrollBottomNavigationBarApp();
  },
  "AnimatedBottomNavigationBarApp": (context) {
    return new AnimatedBottomNavigationBarApp();
  },
  "ScrollablePositionedListPage  A list with helper methods to programmatically scroll to an item.":
      (context) {
    return new ScrollablePositionedListPage();
  },
  "FullScreenMenuApp": (context) {
    return new FullScreenMenuApp();
  },
  "SettingsUiApp": (context) {
    return new SettingsUiApp();
  },
  "FlutterEasyloadingApp  很好用": (context) {
    return new FlutterEasyloadingApp();
  },
  "FrefreshApp": (context) {
    return new FrefreshApp();
  },
  "PaletteGeneratorApp": (context) {
    return new PaletteGeneratorApp();
  },
  "pull_to_refreshApp 重要好好研究": (context) {
    return new pull_to_refreshApp();
  },
  "KeyboardAvoiderApp 重要好好研究": (context) {
    return new KeyboardAvoiderApp();
  },
  "ToastApp": (context) {
    return new ToastApp();
  },
  "ScrollToIndexApp  scroll to the index of any scrollable widget in Flutter":
      (context) {
    return new ScrollToIndexApp();
  },
};
