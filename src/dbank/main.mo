import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";



actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 100;


  stable var startTime = Time.now();
  startTime:= Time.now();


  let id = 123456789;


  public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func cashOut(amount: Float){
    let tempValue:Float = currentValue - amount;
    if (tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount is too large, current value is less than zero");
    };
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };


  public func compound (){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElaspedS = timeElapsedNS/1000000000;
    Debug.print(debug_show(timeElaspedS));
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElaspedS));

  };


}

