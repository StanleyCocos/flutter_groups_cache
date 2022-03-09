import Flutter
import UIKit

public class SwiftFlutterGroupsPlugin: NSObject, FlutterPlugin {
    
    var user: UserDefaults?
    
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_groups", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterGroupsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      let method = call.method;
      let argument = call.arguments
      switch(method){
      case "init":
          result(initName(getArgumentString(argument)))
      case "getGroupString":
          result(getGroupString(getArgumentString(argument)))
      case "getGroupInt":
          result(getGroupInt(getArgumentString(argument)))
      case "getGroup":
          result(getGroup(getArgumentString(argument)))
      case "setGroupString":
          let map = getArgumentKeyString(argument)
          guard let maps = map else {
              result(0)
              return
          }
          result(setGroup(maps.key ,value: maps.value))
      case "setGroupInt":
          let map = getArgumentKeyInt(argument)
          guard let maps = map else {
              result(0)
              return
          }
          result(setGroup(maps.key ,value: maps.value))
      case "setGroup":
          let map = getArgumentKeyAny(argument)
          guard let maps = map else {
              result(0)
              return
          }
          result(setGroup(maps.key ,value: maps.value))
      default:
          break
      }
      
  }
    
    private func getArgumentString(_ argument: Any?) -> String {
        let value = argument as? String
        guard let value = value else {
            return ""
        }
        return value
    }
    
    private func getArgumentInt(_ argument: Any?) -> Int {
        let value = argument as? Int
        guard let value = value else {
            return 0
        }
        return value
    }
    
    private func getArgumentKeyInt(_ argument: Any?) -> (key: String, value: Int)? {
        let value = argument as? [Any]
        guard let value = value else {
            return nil
        }
        if value.count < 2 { return nil}
        let keys = value[0]
        let keyTemp = keys as? String
        guard let k = keyTemp else { return nil}
        let values = value[1]
        let valueTemp = values as? Int
        guard let v = valueTemp else { return nil}
        return (k, v)
    }
    
    private func getArgumentKeyString(_ argument: Any?) ->(key: String, value: String)?{
        let value = argument as? [Any]
        guard let value = value else {
            return nil
        }
        if value.count < 2 { return nil }
        let keys = value[0]
        let keyTemp = keys as? String
        guard let k = keyTemp else { return nil }
        let values = value[1]
        let valueTemp = values as? String
        guard let v = valueTemp else { return nil }
        return (k, v)
    }
    
    private func getArgumentKeyAny(_ argument: Any?) ->(key: String, value: Any)?{
        let value = argument as? [Any]
        guard let value = value else {
            return nil
        }
        if value.count < 2 { return nil }
        let keys = value[0]
        let keyTemp = keys as? String
        guard let k = keyTemp else { return nil }
        let v = value[1]
        return (k, v)
    }
    
}

extension SwiftFlutterGroupsPlugin {
    
    public func initName(_ name: String){
        user = UserDefaults.init(suiteName: name)
    }
    
    public func getGroupString(_ name: String) -> String {
        guard let user = user else { return "" }
        let temp = user.object(forKey: name)
        let values = temp as? String ?? ""
        return values
    }
    
    
    public func getGroupInt(_ name: String) -> Int{
        guard let user = user else { return 0 }
        let temp = user.object(forKey: name)
        let values = temp as? Int ?? 0
        return values
    }
    
    public func getGroup(_ name: String) -> Any?{
        guard let user = user else { return nil }
        let temp = user.object(forKey: name)
        return temp
    }

    
    public func setGroup(_ name: String, value: Any){
        guard let user = user else { return }
        return user.set(value, forKey: name)
    }
}




