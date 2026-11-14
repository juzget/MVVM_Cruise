import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  const BookingControlsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CruiseBookingViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trip Preferences',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          // 1. Visit Date Picker
          ListTile(
            title: const Text('Cruise Date'),
            subtitle: Text(
              '${viewModel.selectedDate.day}/${viewModel.selectedDate.month}/${viewModel.selectedDate.year}',
            ),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: viewModel.selectedDate,
                firstDate: DateTime(2024),
                lastDate: DateTime(2030),
              );
              if (picked != null) {
                viewModel.updateVisitDate(picked);
              }
            },
          ),
          // 2. Cruise Package Dropdown
          ListTile(
            title: const Text('Transport Mode'),
            trailing: DropdownButton<String>(
              value: viewModel.selectedPackage,
              onChanged: (String? newValue) {
                viewModel.updatePackage(newValue);
              },
              items: viewModel.availablePackages
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          // 3. Dark Mode Theme Switch
          SwitchListTile(
            title: const Text('Dark Mode Theme'),
            value: viewModel.isDarkMode,
            onChanged: (bool value) {
              viewModel.toggleTheme(value);
            },
          ),
        ],
      ),
    );
  }
}