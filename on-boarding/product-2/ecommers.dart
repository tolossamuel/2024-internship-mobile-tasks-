
import 'dart:io';

import 'controller.dart';

class HomePage {
  HomePage(){
    Controller controller = Controller();
    while(true){
      print("1/ Add New Product\n2/ View All Product\n3/ View Specific product\n4/ Edite Product\n5/ Delete Product\n6/ Exite");
      print("Enter ur number : ");
      String? chooseInput = stdin.readLineSync();
      int? choose = int.tryParse(chooseInput ?? '');
      switch (choose){
        case 1:
          controller.takeInputForAdd();
          break;
        case 2:
          controller.allData();
          break;
        case 3:
          controller.takeInputForSearch();
        case 4:
          controller.edite();
          break;
        case 5:
          controller.delete();
        case 6:
          return;
        default:
          print("enter corect number");
        

      }
    }
  }
}
void main(){
  // start the proejocet
  HomePage();
}