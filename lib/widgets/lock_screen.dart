import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/number_symbols.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:flutter_app_lock/flutter_app_lock.dart';
class LockScreen extends StatefulWidget {
  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  List<int> truePincode = [5, 6, 7, 8];
  bool isPin = false;
  bool isPressed = false;
  List<bool> isButtonPressed = List.generate(11, (_) => false); // Список для збереження стану кожної кнопки (10 кнопок)
  List<int> pinNumbers = List.generate(4,(_)=>-1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Код для входу',
              style: TextStyle(
                color: Color.fromARGB(255, 39, 134, 100),
                fontFamily: 'Inter',
                fontSize: 32,
                fontWeight: FontWeight.w400,
                height: 1.2125,
              ),
            ),
            SizedBox(height: 70),
            Container(
              width: 360,
              height: 500,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 115,
                    child: buildPinButton(' ',0),
                  ),Positioned(
                    top: 0,
                    left: 155,
                    child: buildPinButton(' ',1),
                  ),Positioned(
                    top: 0,
                    left: 195,
                    child: buildPinButton(' ',2),
                  ),Positioned(
                    top: 0,
                    left: 235,
                    child: buildPinButton(' ',3),
                  ),
                  Positioned(
                    top: 100,
                    left: 35,
                    child: buildNumberButton('1', 0),
                  ),
                  Positioned(
                    top: 100,
                    left: 140,
                    child: buildNumberButton('2',1),
                  ),
                  Positioned(
                    top: 100,
                    left: 245,
                    child: buildNumberButton('3',2),
                  ),
                  Positioned(
                    top: 200,
                    left: 35,
                    child: buildNumberButton('4',3),
                  ),
                  Positioned(
                    top: 200,
                    left: 140,
                    child: buildNumberButton('5',4),
                  ),
                  Positioned(
                    top: 200,
                    left: 245,
                    child: buildNumberButton('6',5),
                  ),
                  Positioned(
                    top: 300,
                    left: 35,
                    child: buildNumberButton('7',6),
                  ),
                  Positioned(
                    top: 300,
                    left: 140,
                    child: buildNumberButton('8',7),
                  ),
                  Positioned(
                    top: 300,
                    left: 245,
                    child: buildNumberButton('9',8),
                  ),
                  Positioned(
                    top: 400,
                    left: 140,
                    child: buildNumberButton('0',9),
                  ),
                  Positioned(
                    top: 460,
                    left: 244,
                    child: buildSymbolButton('╳'),
                  ),
                ],
              ),
            ),
            Text(
              'Не пам\'ятаю код для входу',
              style: TextStyle(
                color: Color.fromARGB(255, 39, 134, 100),
                fontFamily: 'Inter',
                fontSize: 16,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400,
                height: 1.2125,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNumberButton(String number, int index) {
    return GestureDetector(
      onTapDown: (_) {
        for(int i = 0; i<=4;i++)
        {
          if(i==4)
          {
            for(int j =0; j<4;j++)
            {
              if(pinNumbers[j]==truePincode[j])
              {
                  if(j==3)
                  {
                    /*if (pinNumbers ==
                    await ([TargetPlatform.linux]
                            .contains(Theme.of(context).platform)
                        ? SharedPreferences.getInstance().then(
                            (prefs) => prefs.getString(SettingKeys.appLockKey),
                          )
                        : const FlutterSecureStorage()
                            .read(key: SettingKeys.appLockKey))) { */
                      AppLock.of(context)!.didUnlock();      
                      print("Pin Code succesful");
                  }
              }else{
                for(int j =0; j<4;j++)
                { 
                  pinNumbers[j]=-1;
                }Vibrate.feedback(FeedbackType.error);
                break;         
              }
            }
          }
          if(i!=4){
            if(pinNumbers[i]==-1)
            { 
                try {
                  if(index==9)
                {
                  pinNumbers[i]=0;
                  if(i!=3)
                  break;
                }else{
                  pinNumbers[i]=index+1;
                  if(i!=3)
                  break;
                }
              } catch (e){
                /////////код перевірки пін кода///////////////
              } 
            }
          }
        }
        setState(() {
          isButtonPressed[index] = true; // Встановлюємо стан натиснутої кнопки відповідно до індексу
        });
      },
      onTapUp: (_) {
        setState(() {
          isButtonPressed[index] = false; // Скасовуємо стан натиснутої кнопки відповідно до індексу
        });
      },

      child: AnimatedBuilder(
         animation: controller, // Потрібен анімаційний контролер
          builder: (_, __) {
        return Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(55),
              border: Border.all(
                color: isButtonPressed[index] ? Color.fromARGB(255, 21, 181, 119) : Color.fromARGB(255, 39, 134, 100),
                width: isButtonPressed[index] ? 3 : 2,
              ),
              color: Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(61, 113, 112, 112),
                  offset: isButtonPressed[index] ? Offset(0, 3) : Offset(0, 7) ,
                  blurRadius: isButtonPressed[index] ? 2:3,
                ),
              ],
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 39, 134, 100),
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  Widget buildPinButton(String symbol,int index) {
    
    return Container(
      width: 21,
      height: 21, // Висота кнопки залежить від масштабного коефіцієнта
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
                  color: const Color.fromARGB(255, 0, 110, 0),
                  width: 2,
                ),
        color: pinNumbers[index].isNegative ? Color.fromARGB(255, 255, 255, 255) : Color.fromARGB(255, 39, 134, 100), // Колір фону кнопки
      ),
      child: Center(
        child: Text(
          symbol,
          style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 39, 134, 100)),
        ),
      ),
    );
  }  

  Widget buildSymbolButton(String symbol) {
    return Container(
      transform: Matrix4.rotationZ(-90 * 3.14 / 180),
      width: 45,
      height: 75,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 250, 250),
      ),
      child: InkWell(
        onTap: () {
          for (int i = 3; i >= 0; i--) {
            if (pinNumbers[i] != -1) {
              setState(() {
                pinNumbers[i] = -1;
              });
              break;
            }
          }
        },
        child: Center(
          child: Text(
            symbol,
            style: TextStyle(fontSize: 42, color: const Color.fromARGB(255, 39, 134, 100)),
          ),
        ),
      ),
    );
  }
}


