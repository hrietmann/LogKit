import Foundation
import Darwin



public struct LogKit {
    
    
    public static var memoryGBUsage: Double {
        let TASK_VM_INFO_COUNT = mach_msg_type_number_t(MemoryLayout<task_vm_info_data_t>.size / MemoryLayout<integer_t>.size)
        let TASK_VM_INFO_REV1_COUNT = mach_msg_type_number_t(MemoryLayout.offset(of: \task_vm_info_data_t.min_address)! / MemoryLayout<integer_t>.size)
        var info = task_vm_info_data_t()
        var count = TASK_VM_INFO_COUNT
        let kr = withUnsafeMutablePointer(to: &info) { infoPtr in
            infoPtr.withMemoryRebound(to: integer_t.self, capacity: Int(count)) { intPtr in
                task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), intPtr, &count)
            }
        }
        let usedBytes: UInt64
        if kr == KERN_SUCCESS, count >= TASK_VM_INFO_REV1_COUNT
        { usedBytes = info.phys_footprint }
        else { usedBytes = 0 }
        
        let usedGB = Double(usedBytes) / 1024 / 1024 / 1024
        return usedGB
    }
    
    
    public static func log(level: LogIndentation,
                           `as`: LogInfo,
                           filePath: StaticString = #filePath,
                           file: StaticString = #file,
                           line: UInt = #line,
                           column: UInt = #column,
                           _ items: [Any])
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "[ hh:mm:ss.SSS ]"
        dateFormatter.locale = .current
        let now = dateFormatter.string(from: Date())
        
        var lines = [String]()
        if let firstItem = items.first {
            if let items = firstItem as? [Any] {
                if let first = items.first {
                    lines.append("\(now)\(level.rawValue) \(`as`.rawValue) " + String(describing: first))
                } else {
                    lines.append("\(now)\(level.rawValue) \(`as`.rawValue) " + "No items to print...")
                }
                lines.append(contentsOf: items.dropFirst().map { String(describing: $0) })
            } else {
                lines.append("\(now)\(level.rawValue) \(`as`.rawValue) " + String(describing: firstItem))
            }
        } else {
            lines.append("\(now)\(level.rawValue) \(`as`.rawValue) " + "No items to print...")
        }
        items.dropFirst().forEach { lines.append(String(describing: $0)) }
        if `as` == .warning || `as` == .error || `as` == .fatalError {
            lines.append(contentsOf: [
                "file path: \(filePath)",
                "file name: \(file)",
                "line: \(line)",
                "column: \(column)"
            ])
        }
        let string = lines.joined(separator: "\n\(now)\(level.rawValue)    - ")
        Swift.print(string)
    }
    
    
    
}
