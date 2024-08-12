// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class backgroundex extends StatefulWidget {
//   const backgroundex({super.key});
//
//   @override
//   State<backgroundex> createState() => _backgroundexState();
// }
// enum ImageOption {image1,image2,image3,image4,image5,image6}
//
// class _backgroundexState extends State<backgroundex> {
//
//   ImageOption _selectedImageOption  = ImageOption.image1;
//
//   Map <ImageOption,String> image= {
//     ImageOption.image1: "images/bakgroud/background_01.jpeg",
//     ImageOption.image2: "images/bakgroud/background_02.jpeg",
//     ImageOption.image3: "images/bakgroud/background_03.jpeg",
//     ImageOption.image4: "images/bakgroud/background_04.jpeg",
//     ImageOption.image5: "images/bakgroud/background_05.jpeg",
//     ImageOption.image6: "images/bakgroud/background_06.jpeg",
//
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Select Image for Background"),),
//       body: Stack(
//           children: [
//             Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   image:DecorationImage(
//                     image: AssetImage(image[_selectedImageOption]!),
//                     fit: BoxFit.cover,
//                   )
//                 ),
//                 width: 400,
//                 height: 400,
//               ),
//             ),
//             Card(
//               color: Colors.transparent,
//               child: Column(
//                 children: [
//
//                   ListTile(
//                     title: const Text('image1',style: TextStyle(color: Colors.white),),
//                     leading: Radio(
//                       value: ImageOption.image1,
//                       groupValue: _selectedImageOption ,
//                       onChanged: (ImageOption? value)
//                       {
//                         setState(()
//                         {
//                           _selectedImageOption  = value!;
//                         });
//                       },
//                     ),
//                   ),
//
//                   ListTile(
//                     title: const Text('image2',style: TextStyle(color: Colors.white),),
//                     leading: Radio(
//                       value: ImageOption.image2,
//                       groupValue: _selectedImageOption ,
//                       onChanged: (ImageOption? value)
//                       {
//                         setState(()
//                         {
//                           _selectedImageOption  = value!;
//                         });
//                       },
//                     ),
//                   ),
//
//
//                   ListTile(
//                     title: const Text('image3',style: TextStyle(color: Colors.white),),
//                     leading: Radio(
//                       value: ImageOption.image3,
//                       groupValue: _selectedImageOption ,
//                       onChanged: (ImageOption? value)
//                       {
//                         setState(()
//                         {
//                           _selectedImageOption  = value!;
//                         });
//                       },
//                     ),
//                   ),
//
//                   ListTile(
//                     title: const Text('image4',style: TextStyle(color: Colors.white),),
//                     leading: Radio(
//                       value: ImageOption.image4,
//                       groupValue: _selectedImageOption ,
//                       onChanged: (ImageOption? value)
//                       {
//                         setState(()
//                         {
//                           _selectedImageOption  = value!;
//                         });
//                       },
//                     ),
//                   ),
//
//                   ListTile(
//                     title: const Text('image5',style: TextStyle(color: Colors.white),),
//                     leading: Radio(
//                       value: ImageOption.image5,
//                       groupValue: _selectedImageOption ,
//                       onChanged: (ImageOption? value)
//                       {
//                         setState(()
//                         {
//                           _selectedImageOption  = value!;
//                         });
//                       },
//                     ),
//                   ),
//
//                   ListTile(
//                     title: const Text('image6',style: TextStyle(color: Colors.white),),
//                     leading: Radio(
//                       value: ImageOption.image6,
//                       groupValue: _selectedImageOption ,
//                       onChanged: (ImageOption? value)
//                       {
//                         setState(()
//                         {
//                           _selectedImageOption  = value!;
//                         });
//                       },
//                     ),
//                   ),
//
//                 ],
//               ),
//             )
//           ],
//       ),
//     );
//   }
// }
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class backgroundpage extends StatefulWidget {
  const backgroundpage({super.key});

  @override
  State<backgroundpage> createState() => _BackgroundPageState();
}

enum ImageOption { image1, image2, image3, image4, image5 ,image6}

class _BackgroundPageState extends State<backgroundpage> {
  ImageOption _selectedImageOption = ImageOption.image1;

  Map<ImageOption, String> _imagePaths = {
    ImageOption.image1: "images/background_01.jpeg",
    ImageOption.image2: "images/background_02.jpeg",
    ImageOption.image3: "images/background_03.jpeg",
    ImageOption.image4: "images/background_04.jpeg",
    ImageOption.image5: "images/background_05.jpeg",
    ImageOption.image6: "images/background_06.jpeg",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select One for Background")),
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_imagePaths[_selectedImageOption]!),
                  fit: BoxFit.cover,
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Card(
            color: Colors.transparent,
            child: Column(
              children: [
                ListTile(
                  title: const Text('Image 1', style: TextStyle(color: Colors.white)),
                  leading: Radio(
                    value: ImageOption.image1,
                    groupValue: _selectedImageOption,
                    onChanged: (ImageOption? value) {
                      setState(() {
                        _selectedImageOption = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Image 2', style: TextStyle(color: Colors.white)),
                  leading: Radio(
                    value: ImageOption.image2,
                    groupValue: _selectedImageOption,
                    onChanged: (ImageOption? value) {
                      setState(() {
                        _selectedImageOption = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Image 3', style: TextStyle(color: Colors.white)),
                  leading: Radio(
                    value: ImageOption.image3,
                    groupValue: _selectedImageOption,
                    onChanged: (ImageOption? value) {
                      setState(() {
                        _selectedImageOption = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Image 4', style: TextStyle(color: Colors.white)),
                  leading: Radio(
                    value: ImageOption.image4,
                    groupValue: _selectedImageOption,
                    onChanged: (ImageOption? value) {
                      setState(() {
                        _selectedImageOption = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Image 5', style: TextStyle(color: Colors.white)),
                  leading: Radio(
                    value: ImageOption.image5,
                    groupValue: _selectedImageOption,
                    onChanged: (ImageOption? value) {
                      setState(() {
                        _selectedImageOption = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Image 6', style: TextStyle(color: Colors.white)),
                  leading: Radio(
                    value: ImageOption.image6,
                    groupValue: _selectedImageOption,
                    onChanged: (ImageOption? value) {
                      setState(() {
                        _selectedImageOption = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
