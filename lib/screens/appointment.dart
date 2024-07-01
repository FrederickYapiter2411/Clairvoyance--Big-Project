import 'package:clairvoyant_tubes/data/inbox_data.dart';
import 'package:clairvoyant_tubes/models/messages.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MakeAppointment extends StatefulWidget {
  const MakeAppointment({super.key});

  @override
  State<MakeAppointment> createState() => _MakeAppointmentState();
}

class _MakeAppointmentState extends State<MakeAppointment> {
  DateTime selectedDate = DateTime.now();
  DateFormat formatter = DateFormat("dd - MM - yyyy");
  TimeOfDay selectedTime = TimeOfDay.now();

  final _dateC = TextEditingController();
  final _timeC = TextEditingController();
  final _roomC = TextEditingController();
  String? selectedType;

  @override
  void initState() {
    super.initState();
    _dateC.text = formatter.format(selectedDate);
    _timeC.text =
        '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _dateC.clear();
    _timeC.clear();
    _roomC.clear();
    selectedType = '';
    _dateC.dispose();
    _timeC.dispose();
    _roomC.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        _dateC.text = formatter.format(selectedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        _timeC.text =
            '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Select Date and Time:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(formatter.format(selectedDate)),
                          const Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Time',
                        border: OutlineInputBorder(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                              '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}'),
                          const Icon(Icons.access_time),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Appointment Type:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Select Type',
                border: OutlineInputBorder(),
              ),
              value: selectedType,
              items: <String>['Consultation', 'Check-up', 'Procedure', 'Other']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedType = value;
                });
              },
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _roomC,
              decoration: const InputDecoration(
                labelText: 'Room',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String selectedDateC = _dateC.text;
                  String selectedTimeC = _timeC.text;
                  String selectedroomC = _roomC.text;
                  String selectedAppType = selectedType ?? '';

                  MessageData newMessage = MessageData(
                    judul: selectedAppType,
                    tempat: selectedroomC,
                    tanggal: selectedDateC,
                    waktu: selectedTimeC,
                  );
                  messageDatas.add(newMessage);
                  dispose();
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                  child: Text(
                    'Book Appointment',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
