import 'package:attendence_app/Features/NavBar/custom_navbar.dart';
import 'package:attendence_app/Features/NavBar/drawer_menu_button.dart';
import 'package:attendence_app/widgets/customScaffoldWidget.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SubscriptionPlanView extends StatefulWidget {
  const SubscriptionPlanView({super.key});

  @override
  State<SubscriptionPlanView> createState() => _SubscriptionPlanViewState();
}

class _SubscriptionPlanViewState extends State<SubscriptionPlanView> {
  String selectedCountry = "United States";
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: const Text(
          
          "Subscription",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
             //drawer: CustomNavDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Stack(
           // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Close Button
              // Align(
              //   alignment: Alignment.topRight,
              //   child: IconButton(
              //     icon: const Icon(Icons.close),
              //     onPressed: () {},
              //   ),
              // ),

              // const SizedBox(height: 4),
        Column(
             crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 10,),
                  // Center(
                  //   child:  Text(
                  //                   "Subscription".toUpperCase(),
                  //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  //                 ),
                  // ),
           //   const SizedBox(height: 15),

              // Price & Plan
              const Text(
                "Yearly plan",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              const Text(
                "\$49.00 ",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                "due today",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              const Text(
                "Next payment on June 22, 2025",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // Card Number
              const Text(
                "Credit or Debit Cards*",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
               Image.asset('assets/creditcard.avif', height: 50,width: MediaQuery.of(context).size.width *0.95,),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "1234 1234 1234 1234",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // suffixIcon: Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     Image.asset('assets/creditcard.avif', height: 20),
                  //     // const SizedBox(width: 6),
                  //     // Image.asset('assets/mastercard.png', height: 20),
                  //     // const SizedBox(width: 8),
                  //   ],
                  // ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Expiry & CVC
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Expiry*", style: TextStyle(fontSize: 14)),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "MM / YY",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("CVC*", style: TextStyle(fontSize: 14)),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "123",
                            suffixIcon: const Icon(Icons.credit_card),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Country Dropdown
              const Text("Country*", style: TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedCountry,
                    items: const [
                      DropdownMenuItem(
                        value: "United States",
                        child: Text("United States"),
                      ),
                      DropdownMenuItem(
                        value: "Canada",
                        child: Text("Canada"),
                      ),
                      DropdownMenuItem(
                        value: "United Kingdom",
                        child: Text("United Kingdom"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Terms
              const Text(
                "By providing your card information, you allow Tiretest.ai to charge your card for future payments in accordance with their terms.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 12),

              // // Coupon Code
              // InkWell(
              //   onTap: () {},
              //   child: const Text(
              //     "🎫 Coupon code",
              //     style: TextStyle(
              //       color: Colors.blue,
              //       decoration: TextDecoration.underline,
              //       fontSize: 14,
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey.shade400),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
    //        Positioned(
    //         top: 1,
    //         left: 1,
    //         child: InkWell(
    //   onTap: () {
    //  Navigator.of(context).pop();
    //   },
    //   child:  CircleAvatar(
    //     radius: 18,
    //     backgroundColor: Colors.grey[100],
    //     child: Icon(Icons.arrow_back)
    //   ),
    // )
    //       ),
            ],
          ),
        ),
      ),
    );
  }
}


// class SubscriptionView extends StatelessWidget {
//   const SubscriptionView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final border = OutlineInputBorder(
//       borderSide: const BorderSide(color: Colors.black, width: 1),
//       borderRadius: BorderRadius.circular(4),
//     );

//     return Scaffold(
//       //  appbartitle: 'Subscription',

//       // appBar: AppBar(
//       //   title: const Text('Subscription Billing'),
//       //   backgroundColor: Colors.white,
//       //   foregroundColor: Colors.black,
//       //   elevation: 0,
//       // ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFE6DCFD), Color(0xFFD8E7FF)],
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//           ),
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 35),
//               const Text(
//                 'BILLING INFO',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//               const SizedBox(height: 16),

//               const Text('FULL NAME'),
//               const SizedBox(height: 4),
//               TextField(
//                 decoration: InputDecoration(
//                   border: border,
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 16,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               const Text('DEBIT/CREDIT CARD NUMBER'),
//               const SizedBox(height: 4),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: '**** **** **** ****',
//                   border: border,
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 16,
//                   ),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),

//               const SizedBox(height: 20),

//               Row(
//                 children: [
//                   // Exp Date
//                   Expanded(
//                     flex: 1,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text('EXP. DATE'),
//                         const SizedBox(height: 4),
//                         TextField(
//                           decoration: InputDecoration(
//                             hintText: 'MM/YY',
//                             border: border,
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 16,
//                             ),
//                           ),
//                           keyboardType: TextInputType.datetime,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 12),

//                   // CVC Code
//                   Expanded(
//                     flex: 1,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text('CVC CODE'),
//                         const SizedBox(height: 4),
//                         TextField(
//                           decoration: InputDecoration(
//                             hintText: '***',
//                             border: border,
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 16,
//                             ),
//                           ),
//                           keyboardType: TextInputType.number,
//                           obscureText: true,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 12),

//                   // ZIP Code
//                   Expanded(
//                     flex: 1,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text('ZIP CODE'),
//                         const SizedBox(height: 4),
//                         TextField(
//                           decoration: InputDecoration(
//                             border: border,
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 16,
//                             ),
//                           ),
//                           keyboardType: TextInputType.number,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 20),

//               const Text('MOBILE PHONE NUMBER'),
//               const SizedBox(height: 4),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: '(xxx) xxx-xxxx',
//                   border: border,
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 16,
//                   ),
//                 ),
//                 keyboardType: TextInputType.phone,
//               ),

//               const SizedBox(height: 16),

//               Center(
//                 child: ElevatedButton(
//                   onPressed: () =>   Focus.of(context).unfocus(),
//                   child: Text(
//                     'Subscribe',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blueAccent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 30,
//                       vertical: 12,
//                     ),
//                   ),
//                 ),
//               ),

//               // const Text(
//               //   "We'll use this to verify your account when you sign in and to send you recurring notifications about your orders.",
//               //   style: TextStyle(fontSize: 12),
//               // ),
//               // const SizedBox(height: 8),
//               // const Text(
//               //   'Standard message & data rates may apply. Message frequency may vary. Reply HELP for help and STOP to cancel.',
//               //   style: TextStyle(fontSize: 12),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
