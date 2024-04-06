import 'package:flutter/material.dart';

class Sample1 extends StatelessWidget {
  final List<Country> countries = [
    Country('United States', 'assets/Group68.png'),
    Country('United Kingdom', 'assets/Group268.png'),
    Country('Germany', 'assets/Group300.png'),
    // Add more countries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dropdown List Example'),
        ),
        body: Center(
          child: CountryDropdown(
            countries: countries,
          ),
        ),
      ),
    );
  }
}

class CountryDropdown extends StatefulWidget {
  final List<Country> countries;

  const CountryDropdown({required this.countries});

  @override
  _CountryDropdownState createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  String? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(183, 183, 183, 1)),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'delivery-truck.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 30,
                    child: Text(
                      'six',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50, // Same height as the row
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(183, 183, 183, 1)),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: DropdownButtonFormField<String>(
                isExpanded:
                    true, // Ensures the dropdown button fills the available width
                // isDense: false,
                value: _selectedCountry,
                items: widget.countries.map((Country country) {
                  return DropdownMenuItem<String>(
                    value: country.name,
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: double
                            .infinity, // Ensure the Row fills the available width
                      ),
                      child: Row(
                        children: [
                          if (_selectedCountry == null ||
                              _selectedCountry != country.name)
                            Image.asset(
                              country.flagImage,
                              width: 30,
                              height: 30,
                            ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(country.name),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCountry = newValue;
                  });
                  // Handle selection
                  print('Selected: $newValue');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Country {
  final String name;
  final String flagImage;

  Country(this.name, this.flagImage);
}
