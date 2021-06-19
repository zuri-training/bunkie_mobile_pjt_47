import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:bunkie/view_models/view_models.dart';

class AppProvider {
  //The providers for dependency injection and state management will be added here
  //as the app will use MultiProvider
  static final providers = <SingleChildWidget>[
    // ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ];
}
