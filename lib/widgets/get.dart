import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Open screens/snackbars/dialogs/bottomSheets without context, manage states and inject dependencies easily with GetX.

class GetApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // It is not mandatory to use named routes, but dynamic urls are interesting.
      initialRoute: '/home',
      defaultTransition: Transition.native,
      translations: MyTranslations(),
      locale: Locale('pt', 'BR'),
      getPages: [
        //Simple GetPage
        GetPage(name: '/home', page: () => First()),
        // GetPage with custom transitions and bindings
        GetPage(
          name: '/second',
          page: () => Second(),
          customTransition: SizeTransitions(),
          binding: SampleBind(),
        ),
        // GetPage with default transitions
        GetPage(
          name: '/third',
          transition: Transition.cupertino,
          page: () => Third(),
        ),
      ],
    );
  }
}

//void main() {
//  runApp();
//}

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'title': 'Hello World %s',
        },
        'en_US': {
          'title': 'Hello World from US',
        },
        'pt': {
          'title': 'Olá de Portugal',
        },
        'pt_BR': {
          'title': 'Olá do Brasil',
        },
      };
}

class Controller extends GetxController {
  int count = 0;

  void increment() {
    count++;
    // use update method to update all count variables
    update();
  }
}

class First extends GetView<Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Get.snackbar("Hi", "I'm modern snackbar");
          },
        ),
        title: Text("title".trArgs(['John'])),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
                init: Controller(),
                // You can initialize your controller here the first time. Don't use init in your other GetBuilders of same controller
                builder: (s) => Text(
                      'clicks: ${controller.count}',
                    )),
            RaisedButton(
              child: Text('Next Route'),
              onPressed: () {
                // Get.toNamed('/second');

                Get.to(Second());
                // PageRouteBuilder(pageBuilder: (BuildContext context,
                //     Animation<double> animation,
                //     Animation<double> secondaryAnimation) {
                //   return null;
                // });
              },
            ),
            RaisedButton(
              child: Text('Change locale to English'),
              onPressed: () {
                Get.updateLocale(Locale('en', 'UK'));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.find<Controller>().increment();
          }),
    );
  }
}

class Second extends GetWidget<ControllerX> {
  @override
  Widget build(BuildContext context) {
    Get.put(ControllerX());
    return Scaffold(
      appBar: AppBar(
        title: Text('second Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<ControllerX>(
              // Using bindings you don't need of init: method
              builder: (_) {
                print("count1 rebuild");
                return Text('${controller.count1.value}');
              },
            ),
            GetX<ControllerX>(
              builder: (_) {
                print("count2 rebuild");
                return Text('${controller.count2.value}');
              },
            ),
            GetX<ControllerX>(builder: (_) {
              print("sum rebuild");
              return Text('${_.sum}');
            }),
            GetX<ControllerX>(
              builder: (_) => Text('Name: ${controller.user.value.name}'),
            ),
            GetX<ControllerX>(
              builder: (_) => Text('Age: ${_.user.value.age}'),
            ),
            RaisedButton(
              child: Text("Go to last page"),
              onPressed: () {
                Get.toNamed('/third', arguments: 'arguments of second');
              },
            ),
            RaisedButton(
              child: Text("Back page and open snackbar"),
              onPressed: () {
                Get.back();
                Get.snackbar(
                  'User 123',
                  'Successfully created',
                );
              },
            ),
            RaisedButton(
              child: Text("Increment"),
              onPressed: () {
                Get.find<ControllerX>().increment();
              },
            ),
            RaisedButton(
              child: Text("Increment"),
              onPressed: () {
                Get.find<ControllerX>().increment2();
              },
            ),
            RaisedButton(
              child: Text("Update name"),
              onPressed: () {
                Get.find<ControllerX>().updateUser();
              },
            ),
            RaisedButton(
              child: Text("Dispose worker"),
              onPressed: () {
                Get.find<ControllerX>().disposeWorker();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Third extends GetWidget<ControllerX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.incrementList();
      }),
      appBar: AppBar(
        title: Text("Third ${Get.arguments}"),
      ),
      body: Center(
          child: Obx(() => ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return Text("${controller.list[index]}");
              }))),
    );
  }
}

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerX>(() => ControllerX());
  }
}

class User {
  User({this.name = 'Name', this.age = 0});

  String name;
  int age;
}

class ControllerX extends GetxController {
  final count1 = 0.obs;
  final count2 = 0.obs;
  final list = [56].obs;
  final user = User().obs;

  updateUser() {
    user.update((value) {
      value.name = 'Jose';
      value.age = 30;
    });
  }

  /// Once the controller has entered memory, onInit will be called.
  /// It is preferable to use onInit instead of class constructors or initState method.
  /// Use onInit to trigger initial events like API searches, listeners registration
  /// or Workers registration.
  /// Workers are event handlers, they do not modify the final result,
  /// but it allows you to listen to an event and trigger customized actions.
  /// Here is an outline of how you can use them:

  /// made this if you need cancel you worker
  Worker _ever;

  @override
  onInit() {
    /// Called every time the variable $_ is changed
    _ever = ever(count1, (_) => print("$_ has been changed (ever)"));

    everAll([count1, count2], (_) => print("$_ has been changed (everAll)"));

    /// Called first time the variable $_ is changed
    once(count1, (_) => print("$_ was changed once (once)"));

    /// Anti DDos - Called every time the user stops typing for 1 second, for example.
    debounce(count1, (_) => print("debouce$_ (debounce)"),
        time: Duration(seconds: 1));

    /// Ignore all changes within 1 second.
    interval(count1, (_) => print("interval $_ (interval)"),
        time: Duration(seconds: 1));
  }

  int get sum => count1.value + count2.value;

  increment() => count1.value++;

  increment2() => count2.value++;

  disposeWorker() {
    _ever.dispose();
    // or _ever();
  }

  incrementList() => list.add(75);
}

class SizeTransitions extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve curve,
      Alignment alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return Align(
      alignment: Alignment.center,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animation,
          curve: curve,
        ),
        child: child,
      ),
    );
  }
}
