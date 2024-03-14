import 'package:flutter/material.dart';

enum Transportation { car, plane, boat, submarine }

class UIControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UIControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UIControlView(),
    );
  }
}

class _UIControlView extends StatefulWidget {
  const _UIControlView();

  @override
  State<_UIControlView> createState() => _UIControlViewState();
}

class _UIControlViewState extends State<_UIControlView> {
  bool isDeveloper = true;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  Transportation selectedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          title: const Text('Developer mode'),
          subtitle: const Text('Additional controls'),
          onChanged: (value) => setState(() {
            isDeveloper = value;
          }),
        ),
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By car.'),
              subtitle: const Text('Viajar por carro.'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By plane.'),
              subtitle: const Text('Viajar por avion.'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By boat.'),
              subtitle: const Text('Viajar por bote.'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By submarine.'),
              subtitle: const Text('Viajar por submarino.'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            )
          ],
        ),
        CheckboxListTile(
          value: wantsBreakfast,
          title: const Text('Do you want breakfast?'),
          subtitle: const Text("It'll be served at 09:00"),
          onChanged: (value) => setState(() {
            wantsBreakfast = value!;
          }),
        ),
        CheckboxListTile(
          value: wantsLunch,
          title: const Text('Do you want lunch?'),
          subtitle: const Text("It'll be served at 12:00"),
          onChanged: (value) => setState(() {
            wantsLunch = value!;
          }),
        ),
        CheckboxListTile(
          value: wantsDinner,
          title: const Text('Do you want dinner?'),
          subtitle: const Text("It'll be served at 19:00"),
          onChanged: (value) => setState(() {
            wantsDinner = value!;
          }),
        ),
      ],
    );
  }
}
