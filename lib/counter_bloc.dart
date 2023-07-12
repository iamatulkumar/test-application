

import 'dart:async';

import 'package:application_test/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final _stateController = StreamController<int>();
  final _eventController = StreamController<CounterEvent>();

  Sink<CounterEvent> get countEventSink => _eventController.sink;

  StreamSink<int> get _incounter => _stateController.sink;

  Stream<int> get counter => _stateController.stream;

   CounterBloc () {
     _eventController.stream.listen(_mapStateOrEvent);
   }

   void _mapStateOrEvent(CounterEvent event) {
       if(event is IncrementEvent) {
         _counter++ ;
       } else if(event is DecrementEvent && _counter>0) {
         _counter--;
       }
       _incounter.add(_counter);
   }
}