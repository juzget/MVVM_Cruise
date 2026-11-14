import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  const CruiseBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CruiseBookingViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sibu River Cruise & Heritage'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            // Mod Portrait: Single Column (ListView)
            return ListView(
              children: [
                HeaderImageWidget(imageUrl: viewModel.destination.imageUrl),
                TitleSectionWidget(
                  title: viewModel.destination.title,
                  location: viewModel.destination.location,
                  ratingCount: viewModel.destination.ratingCount,
                  onStarPressed: () => viewModel.incrementStarRating(),
                ),
                const ActionBarWidget(),
                DescriptionWidget(description: viewModel.destination.description),
                const BookingControlsWidget(),
              ],
            );
          } else {
            // Mod Landscape: Side-by-Side Split Pane (Row + Expanded)
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        HeaderImageWidget(imageUrl: viewModel.destination.imageUrl),
                        DescriptionWidget(description: viewModel.destination.description),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      TitleSectionWidget(
                        title: viewModel.destination.title,
                        location: viewModel.destination.location,
                        ratingCount: viewModel.destination.ratingCount,
                        onStarPressed: () => viewModel.incrementStarRating(),
                      ),
                      const ActionBarWidget(),
                      const BookingControlsWidget(),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}