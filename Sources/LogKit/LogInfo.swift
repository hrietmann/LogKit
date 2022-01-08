//
//  Printer+Info.swift
//  PrinterKit
//
//  Created by Hans Rietmann on 07/11/2021.
//

import Foundation




public struct LogInfo: Equatable {
    
    
    let rawValue: String
    
    public static let error = LogInfo(rawValue: "❌")
    public static let fatalError = LogInfo(rawValue: "🚨")
    public static let warning = LogInfo(rawValue: "⚠️")
    public static let info = LogInfo(rawValue: "ℹ️")
    public static let downloading = LogInfo(rawValue: "🔄")
    public static let loading = LogInfo(rawValue: "💽")
    public static let saving = LogInfo(rawValue: "💾")
    public static let waiting = LogInfo(rawValue: "⏳")
    public static let minorTaskDone = LogInfo(rawValue: "🆗")
    public static let majorTaskDone = LogInfo(rawValue: "✅")
    public static let computing = LogInfo(rawValue: "👨🏽‍💻")
    public static let machineLearning = LogInfo(rawValue: "🧠")
    public static func custom(_ value: String) -> LogInfo { .init(rawValue: value) }
    
    public static func ==(lhs: LogInfo, rhs: LogInfo) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
}
