import 'package:bucqit/ui/Widgets/base_bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends BaseBloc<DashboardEvent> {
  DashboardBloc() : super() {
  }

  @override
  internalMapEventToState(DashboardEvent event) async* {
    if (event is DashboardEvent) {
     
    }
  }
 
}