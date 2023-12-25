import 'package:flutter/material.dart';

void main() {
  runApp(const AppKu());
}

class AppKu extends StatelessWidget{
  const AppKu({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Latihan 16',
      theme: ThemeData(
        // -----------------
        // dapat mengubah font family pada satu per satu widget Text, kita dapat membuat font yang kita daftarkan menjadi default. Caranya dengan menambahkan parameter fontFamily pada kelas ThemeData yang ada pada parameter theme di MaterialApp
          fontFamily: 'Oswald',
          // -----------------
          primarySwatch: Colors.blue
      ),
      home:
      // HomePage(),
      ResponsivePage(),
    );
  }
}



// class HomePage extends StatelessWidget{
//   const HomePage({Key? key}): super(key: key);
//
//   @override
//   Widget build(BuildContext context){
//
//     // MediaQuery
//     // Pendekatan pertama yang akan kita lakukan adalah menggunakan Media Query. Jika Anda sudah familier dengan pengembangan web, mungkin Anda sudah tidak asing dengan konsep ini. MediaQuery adalah kelas yang dapat kita gunakan untuk mendapatkan ukuran dan juga orientasi layar.
//
//     Size screenSize = MediaQuery.of(context).size;
//     Orientation orientation = MediaQuery.of(context).orientation;
//
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       body:

//  penerapan media query

//       // Column(
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   crossAxisAlignment: CrossAxisAlignment.stretch,
//       //   children: [
//       //     Text('Screen Width: ${screenSize.width.toStringAsFixed(2)}',style: const TextStyle(color: Colors.white, fontSize: 18), textAlign: TextAlign.center),
//       //     Text('Orientation: $orientation',style: const TextStyle(color: Colors.white, fontSize: 18), textAlign: TextAlign.center)
//       //   ],
//       // ),

// ----------------
// penerapan layoutbuilder
// Layout Builder
/*
Cara lain yang bisa kita gunakan adalah dengan widget LayoutBuilder. Perbedaan umum antara MediaQuery dan Layout Builder adalah MediaQuery akan mengembalikan ukuran layar yang digunakan, sedangkan LayoutBuilder mengembalikan ukuran maksimum dari widget tertentu.
 */

//       Row(
//        children: [
//          Expanded(
//            child: LayoutBuilder(
//              builder: (BuildContext context, BoxConstraints constraints){
//                return Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: [
//                    Text('Media Query: ${screenSize.width.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 18), textAlign: TextAlign.center),
//                    Text('Layout Builder: ${constraints.maxWidth}', style: const TextStyle(color: Colors.white, fontSize: 18), textAlign: TextAlign.center)
//                  ],
//                );
//              },
//            ),
//          ),
//          Expanded(
//            flex: 3,
//            child: LayoutBuilder(
//              builder: (BuildContext context, BoxConstraints constraints){
//                return Container(
//                  color: Colors.white,
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
//                    children: [
//                      Text('Media Query ${screenSize.width.toStringAsFixed(2)}',style: const TextStyle(color: Colors.blueGrey, fontSize: 18), textAlign: TextAlign.center),
//                      Text('Layout Builder: ${constraints.maxWidth}',style: const TextStyle(color: Colors.blueGrey, fontSize: 18), textAlign: TextAlign.center),
//                    ],
//                  ),
//                );
//              },
//            ),
//          )
//        ],
//       )
//     );
//   }
// }

// ---------------
/*
Dengan mendapatkan ukuran lebar dan tinggi layar seperti di atas, kita bisa menentukan tampilan konten berdasarkan ukuran layar yang digunakan.
Dalam responsive design, terdapat breakpoint yang merupakan “titik” di mana layout akan beradaptasi untuk memberikan pengalaman pengguna sebaik mungkin.

Dengan kode di bawah ini berarti akan terdapat tiga model tampilan berdasarkan ukuran layar:
 */
class ResponsivePage extends StatelessWidget{
  const ResponsivePage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          if(constraints.maxWidth < 600){
            return ListView(
              children: _generateContainers()
            );
          }else if(constraints.maxWidth < 900){
            return GridView.count(
                crossAxisCount: 2,
                children: _generateContainers()
            );
          }else{
            return GridView.count(
                crossAxisCount: 6,
                children: _generateContainers()
            );
          }
        },
      ),
    );
  }

  List<Widget> _generateContainers(){
    return List<Widget>.generate(20, (index){
      return Container(
        margin: const EdgeInsets.all(8),
        color: Colors.blueGrey,
        height: 200,
      );
    });
  }
}





