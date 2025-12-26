/**
 @module: Util
 @author: kimsm
 @since: 12/11/25
 @desc
 @remark
 */
import Foundation
import Extensions

public enum LogType {
    case pen
    case acc
    case network
    case networkDetail
    case error
    case videoLib
    case etc
}

public func printLog(_ log: Any?,
                     type: LogType = .etc,
                     file: String = #file,
                     funcName: String = #function,
                     line: Int = #line
){
    
    let fileName = (file as NSString).lastPathComponent
    let time = Date().string(format: "yy.MM.dd HH:mm:ss")
    var icon = "🍎"
    if type == .error  {
        icon = "❌"
    }
    else if type == .videoLib  {
        icon = "📚"
    }
    
    let debugLog = "\n\(icon)\n💡FILE = \(fileName)\n💡FUNC = \(funcName)\n💡LINE = \(line)\n💡LOG = \(log ?? "NULL") \n💡TIME = \(time)\n\(icon)\n"
    
        
    let acceptedLogType: [LogType] = [.network, .networkDetail, .acc, .error, .videoLib, .etc]
    
    guard acceptedLogType.contains(type) else {
        return
    }        
    
    #if DEBUG
    print(debugLog)
    #else
    #endif
}
