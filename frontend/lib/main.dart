import 'package:flutter/material.dart';
import 'package:frontend/services/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLService.clientToQuery(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0.0,
            titleTextStyle: Theme.of(context).textTheme.titleLarge,
            backgroundColor: Colors.transparent,
            iconTheme: IconTheme.of(context).copyWith(),
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(fontSize: 16.0, height: 1.5),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
