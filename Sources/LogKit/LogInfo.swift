//
//  Printer+Info.swift
//  PrinterKit
//
//  Created by Hans Rietmann on 07/11/2021.
//

import Foundation




public struct LogInfo: Equatable {
    
    
    let rawValue: String
    
    public static let error = LogInfo(rawValue: "â")
    public static let fatalError = LogInfo(rawValue: "đ¨")
    public static let warning = LogInfo(rawValue: "â ī¸")
    public static let info = LogInfo(rawValue: "âšī¸")
    public static let downloading = LogInfo(rawValue: "đ")
    public static let loading = LogInfo(rawValue: "đŊ")
    public static let saving = LogInfo(rawValue: "đž")
    public static let waiting = LogInfo(rawValue: "âŗ")
    public static let minorTaskDone = LogInfo(rawValue: "đ")
    public static let majorTaskDone = LogInfo(rawValue: "â")
    public static let computing = LogInfo(rawValue: "đ¨đŊâđģ")
    public static let machineLearning = LogInfo(rawValue: "đ§ ")
    public static func custom(_ value: String) -> LogInfo { .init(rawValue: value) }
    
    public static func ==(lhs: LogInfo, rhs: LogInfo) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
}
