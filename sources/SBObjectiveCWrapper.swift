//
//  SBObjectiveCWrapper.swift
//  SBObjectiveCWrapper
//
//  Created by Reese McLean on 12/21/15.
//  Copyright © 2015 Reese McLean. All rights reserved.
//

import Foundation
import SwiftyBeaver

protocol Loggable: class {
    
    static func verbose(_ msg: @autoclosure () -> Any, _ path: String, _ function: String, line: Int)
    static func debug(_ msg: @autoclosure () -> Any, _ path: String, _ function: String, line: Int)
    static func info(_ msg: @autoclosure () -> Any, _ path: String, _ function: String, line: Int)
    static func warning(_ msg: @autoclosure () -> Any, _ path: String, _ function: String, line: Int)
    static func error(_ msg: @autoclosure () -> Any, _ path: String, _ function: String, line: Int)
    
}

extension SwiftyBeaver: Loggable {}

public class SBObjectiveCWrapper: NSObject {
    
    @objc class func _setLogClassForTesting(_ logClass: AnyObject) {
        self.logClass = logClass as! Loggable.Type
    }
    
    static var logClass: Loggable.Type = SwiftyBeaver.self
    
    public class func logVerbose(_ message: String, filePath: String, function: String, line: Int) {
        
        logClass.verbose(message, filePath, function, line: line)
        
    }
    
    public class func logDebug(_ message: String, filePath: String, function: String, line: Int) {
        
        logClass.debug(message, filePath, function, line: line)
        
    }
    
    public class func logInfo(_ message: String, filePath: String, function: String, line: Int) {
        
        logClass.info(message, filePath, function, line: line)
        
    }
    
    public class func logWarning(_ message: String, filePath: String, function: String, line: Int) {
        
        logClass.warning(message, filePath, function, line: line)
        
    }
    
    public class func logError(_ message: String, filePath: String, function: String, line: Int) {
        
        logClass.error(message, filePath, function, line: line)
        
    }
    
}
