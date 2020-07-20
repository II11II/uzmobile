/* 
@Authour: Islomkuja Akhrorov
Created at: 7/13/20
*/

import 'package:mobiuz/repository/repository.dart';

abstract class BaseBloc {
  final repo = Repository();
  void dispose();
}
