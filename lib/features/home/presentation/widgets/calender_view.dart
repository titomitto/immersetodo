import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/presentation.dart';

class CalenderView extends ConsumerWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final authState = ref.watch(authStateProvider);
    if (authState is! Authenticated) {
      return Container();
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          height: 90,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: _generateDateWidgets(),
          ),
        ),
      ],
    );
  }

  List<Widget> _generateDateWidgets() {
    final currentDate = DateTime.now();
    final startingDay =
        currentDate.subtract(Duration(days: currentDate.weekday - 1));

    return List<Widget>.generate(7, (index) {
      final date = startingDay.add(Duration(days: index));
      final day = _getFormattedDay(date.weekday);
      final formattedDate = _getFormattedDate(date.day);
      final isCurrentDay = currentDate.day == date.day &&
          currentDate.month == date.month &&
          currentDate.year == date.year;

      return DayWidget(
        day: day,
        date: formattedDate,
        isCurrentDay: isCurrentDay,
      );
    });
  }

  String _getFormattedDay(int weekday) {
    const daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return daysOfWeek[weekday - 1];
  }

  String _getFormattedDate(int day) {
    return day.toString().padLeft(2, '0');
  }
}

class DayWidget extends StatelessWidget {
  final String day;
  final String date;
  final bool isCurrentDay;

  const DayWidget({
    Key? key,
    required this.day,
    required this.date,
    required this.isCurrentDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black45,
                    ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: isCurrentDay
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  date,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isCurrentDay ? Colors.white : Colors.black,
                      fontSize: 19),
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
          if (isCurrentDay)
            Icon(
              Icons.circle,
              size: 6,
              color: Theme.of(context).primaryColor,
            ),
        ],
      ),
    );
  }
}
