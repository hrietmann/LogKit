//
//  File.swift
//  
//
//  Created by Hans Rietmann on 28/12/2021.
//

import Foundation





public func log(level: LogIndentation, `as`: LogInfo, filePath: StaticString = #filePath, file: StaticString = #file, line: UInt = #line, column: UInt = #column, _ items: Any...)
{ LogKit.log(level: level, as: `as`, filePath: filePath, file: file, line: line, column: column, items) }

public func logInfo(level: LogIndentation = .level0, _ items: Any...)
{ LogKit.log(level: level, as: .info, items) }

public func logWarning(level: LogIndentation = .level0, filePath: StaticString = #filePath, file: StaticString = #file, line: UInt = #line, column: UInt = #column, _ items: Any...)
{ LogKit.log(level: level, as: .warning, filePath: filePath, file: file, line: line, column: column, items) }

public func logError(filePath: StaticString = #filePath, file: StaticString = #file, line: UInt = #line, column: UInt = #column, _ items: Any...)
{ LogKit.log(level: .level0, as: .error, filePath: filePath, file: file, line: line, column: column, items) }

public func logFatalError(filePath: StaticString = #filePath, file: StaticString = #file, line: UInt = #line, column: UInt = #column, _ items: Any...)
{ LogKit.log(level: .level0, as: .fatalError, filePath: filePath, file: file, line: line, column: column, items) }

public func logFatalError(_ error: Error, filePath: StaticString = #filePath, file: StaticString = #file, line: UInt = #line, column: UInt = #column) {
    LogKit.log(level: .level0, as: .fatalError, filePath: filePath, file: file, line: line, column: column, [error.localizedDescription, error])
}
