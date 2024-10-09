import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class OpenHouseTaskScreen extends StatefulWidget {
  @override
  _OpenHouseTaskScreenState createState() => _OpenHouseTaskScreenState();
}

class _OpenHouseTaskScreenState extends State<OpenHouseTaskScreen> {
  late stt.SpeechToText _speech; // Late initialization for speech
  bool _isListening = false;
  bool _isInitialized = false; // Track initialization
  double _fee = 150;
  bool _isListingAgent = false;
  String _text = '';
  bool _isHostingAgent = false;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  late TextEditingController _textController; // Controller for text field

  @override
  void initState() {
    super.initState();
    _initializeSpeechToText();
    _textController = TextEditingController(); // Initialize text controller
  }

  @override
  void dispose() {
    _textController.dispose(); // Dispose controller when no longer needed
    super.dispose();
  }

  // Initialize SpeechToText instance only once
  Future<void> _initializeSpeechToText() async {
    _speech = stt.SpeechToText();
    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );
    if (available) {
      setState(() {
        _isInitialized = true;
      });
    }
  }

  // Method to start listening with speech recognition
  void _listen() {
    if (_isInitialized && !_isListening) {
      setState(() {
        _isListening = true;
      });
      _speech.listen(
        onResult: (val) {
          setState(() {
            _text = val.recognizedWords;
            _textController.text = _text; // Update text controller
          });
        },
      );
    } else if (_isListening) {
      setState(() => _isListening = false);
      _speech.stop(); // Stop listening when mic is tapped again
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[800]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Create Open House Task',
          style: TextStyle(color: Colors.grey[800], fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSliderSection(),
            SizedBox(height: 8),
            _buildTextField('Property Address'),
            SizedBox(height: 8),
            _buildTextField('Duration'),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildDatePicker(context)),
                SizedBox(width: 8),
                Expanded(child: _buildTimePicker(context)),
              ],
            ),
            SizedBox(height: 8),
            _buildOrganiserSection(),
            SizedBox(height: 8),
            _buildDropdown('Enter Property Access Details'),
            SizedBox(height: 8),
            _buildDropdown('Lock Box Details'),
            SizedBox(height: 8),
            _buildDropdown('Do you want to enter client details'),
            SizedBox(height: 8),
            _buildAdditionalNotes(),
            SizedBox(height: 8),
            _buildTotalChargesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Open House Fee',
                style: TextStyle(fontSize: 16, color: Colors.grey[800])),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.indigo,
                border: Border.all(color: Colors.indigo),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    '\$${_fee.round()}',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Slider(
          value: _fee,
          min: 25,
          max: 150,
          divisions: 125,
          activeColor: Colors.indigo,
          inactiveColor: Colors.grey[300],
          label: '\$${_fee.round()}',
          onChanged: (value) {
            setState(() {
              _fee = value;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$25',
                style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            Text('\$150',
                style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField(String labelText) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey[800]),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.indigo),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null && pickedDate != _selectedDate) {
          setState(() {
            _selectedDate = pickedDate;
          });
        }
      },
      child: AbsorbPointer(
        child: TextField(
          decoration: InputDecoration(
            labelText: "${_selectedDate.day}/${_selectedDate
                .month}/${_selectedDate.year}",
            labelStyle: TextStyle(color: Colors.grey[800]),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            prefixIcon: Icon(Icons.calendar_today, color: Colors.indigo),
          ),
        ),
      ),
    );
  }

  Widget _buildTimePicker(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final pickedTime = await showTimePicker(
          context: context,
          initialTime: _selectedTime,
        );
        if (pickedTime != null && pickedTime != _selectedTime) {
          setState(() {
            _selectedTime = pickedTime;
          });
        }
      },
      child: AbsorbPointer(
        child: TextField(
          decoration: InputDecoration(
            labelText: _selectedTime.format(context),
            labelStyle: TextStyle(color: Colors.grey[800]),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            prefixIcon: Icon(Icons.access_time, color: Colors.indigo),
          ),
        ),
      ),
    );
  }

  Widget _buildOrganiserSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Organiser',
            style: TextStyle(color: Colors.grey[800], fontSize: 14)),
        Row(
          children: [
            Checkbox(
              value: _isListingAgent,
              activeColor: Colors.indigo,
              onChanged: (value) {
                setState(() {
                  _isListingAgent = value!;
                });
              },
            ),
            Text('Listing Agent', style: TextStyle(color: Colors.grey[700])),
            Checkbox(
              value: _isHostingAgent,
              activeColor: Colors.indigo,
              onChanged: (value) {
                setState(() {
                  _isHostingAgent = value!;
                });
              },
            ),
            Text('Hosting Agent', style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdown(String labelText) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey[800]),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.indigo),
        ),
      ),
      items: ['Option 1', 'Option 2', 'Option 3']
          .map((option) => DropdownMenuItem(
        value: option,
        child: Text(option),
      ))
          .toList(),
      onChanged: (value) {},
    );
  }

  Widget _buildAdditionalNotes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Additional Notes',
            style: TextStyle(fontSize: 14, color: Colors.grey[800])),
        SizedBox(height: 8),
        TextFormField(
          controller: _textController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Enter notes here...',
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isListening ? Icons.mic : Icons.mic_none,
                color: Colors.indigo,
              ),
              onPressed: _listen, // Call the listen function
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalChargesSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total Charges:',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          Text('\$${_fee.round()}',
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
