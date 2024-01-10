// ignore_for_file: file_names
import 'package:elevy_web_app/utils/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CalculatorContainer extends StatefulWidget {
  const CalculatorContainer({super.key});

  @override
  State<CalculatorContainer> createState() => _DesktopContainerState();
}

class _DesktopContainerState extends State<CalculatorContainer> {
  final TextEditingController _previousAmountController =
      TextEditingController();
  final TextEditingController _currentAmountController =
      TextEditingController();
  double _levyCharge = 0.0;
  double _amountToBePayed = 0.0;

  @override
  void initState() {
    super.initState();

    // Add a listener to the amount controller
    _currentAmountController.addListener(calculateLevy);
  }

  @override
  void dispose() {
    // Dispose of the controllers when they are no longer needed
    _currentAmountController.dispose();
    _previousAmountController.dispose();
    super.dispose();
  }

  //Function to calculate the levy charge
  void calculateLevy() {
    double previousAmount = 0.0;
    double currentAmount = double.tryParse(_currentAmountController.text) ?? 0;

    // Check if the previousAmountController has a valid numeric value
    if (_previousAmountController.text.isNotEmpty) {
      previousAmount = double.tryParse(_previousAmountController.text) ?? 0;
    }

    //Calculate Levy based on specifications
    if (previousAmount == 100) {
      // Calculate 1% levy on the current amount if previous amount is 100
      _levyCharge = currentAmount * 0.01;
    } else {
      double totalAmount = previousAmount + currentAmount;
      if (totalAmount > 100) {
        //Calculate 1% levy on the amount exceeding the first 100 ghs
        _levyCharge = (totalAmount - 100) * 0.01;
      } else {
        //No levy charge if the total amount is 100 GHS or less
        _levyCharge = 0.0;
      }
    }

    _amountToBePayed = _levyCharge + currentAmount;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => desktopContainer(),
    );
  }

  Widget desktopContainer() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: w! / 1.5,
      height: h! / 1.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),

      /*******************    Main Calculator Area     **************/

      // Page Header
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),

          const Text(
            'E-levy Charges Calculator',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.black87),
          ),

          //Page description
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Use the tool below to calculate the E-Levy charge when sending money across all networks.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 15,
          ),

          // TextFields

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextField(
                    /**       Amount already semt textfield     */
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _previousAmountController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _previousAmountController.clear();
                            },
                            icon: const Icon(Icons.clear)),
                        hintText: 'Eg. 120 GHS',
                        labelText: 'Total amount already sent today(GHS)'),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: TextField(
                    /**       Amount you want to send Textfield     */
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _currentAmountController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _currentAmountController.clear();
                            },
                            icon: const Icon(Icons.clear)),
                        hintText: 'Eg. 70 GHS',
                        labelText: 'Amount you want to send(GHS)'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          const Divider(
            indent: 45,
            endIndent: 45,
          ),
          const SizedBox(
            height: 15,
          ),

          const Text('E-levy Charge', style: TextStyle(fontSize: 15)),

          /**       Elevy Charges Displayer     */
          Text(_levyCharge.toStringAsFixed(2),
              style: const TextStyle(
                  fontSize: 50, color: Color.fromARGB(255, 244, 111, 54))),

          const SizedBox(
            height: 15,
          ),

          Container(
              height: h! / 4.8,
              width: w! / 1.7,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 244, 111, 54),
                      width: 1.0),
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      /**       Total amount paid Section     */
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Total amount to be paid'),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          _amountToBePayed.toStringAsFixed(2),
                          style: const TextStyle(fontSize: 35),
                        )
                      ],
                    ),
                    const VerticalDivider(
                      color: Colors.black87,
                      indent: 10,
                      endIndent: 10,
                    ),
                    const Column(
                      /**       Rate first Section     */
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rate(first 100 GHS Exempt)'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '1.0%',
                          style: TextStyle(fontSize: 35),
                        )
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
