//
//  HandyJSONExtension.swift
//  Alamofire
//
//  Created by Fanxx on 2019/8/8.
//

import UIKit
import HandyJSON

public struct EasyHandyJSON {
    open class StringArrayTransform: TransformOf<[String], String> {
        let separator: String
        public init(separator: String = ",") {
            self.separator = separator
            super.init(fromJSON: { (json) -> [String]? in
                return json?.components(separatedBy: separator).filter({ !$0.isEmpty })
            }, toJSON: { (values) -> String? in
                return values?.joined(separator: separator)
            })
        }
    }
    open class StringArrayTransformOf<TargetType: LosslessStringConvertible>: TransformOf<[TargetType], String> {
        let separator: String
        public init(separator: String = ",") {
            self.separator = separator
            super.init(fromJSON: { (json) -> [TargetType]? in
                let strings = json?.components(separatedBy: separator)
                return strings?.compactMap({ (s) -> TargetType? in
                    return TargetType(s)
                })
            }, toJSON: { (values) -> String? in
                if let vs = values, vs.count > 0 {
                    let str = vs.map({ $0.description }).joined(separator: separator)
                    return str
                }else{
                    return ""
                }
            })
        }
    }
    open class MillisecondDateTransform: DateTransform {
        open override func transformFromJSON(_ value: Any?) -> Date? {
            var v: Any? = nil
            if let timeInt = value as? Double {
                v = timeInt / 1000
            }
            if let timeStr = value as? String, !timeStr.isEmpty {
                v = String(timeStr[timeStr.startIndex...timeStr.index(timeStr.endIndex, offsetBy: -3)])
            }
            
            return super.transformFromJSON(v)
        }
        open override func transformToJSON(_ value: Date?) -> Double? {
            if let d = super.transformToJSON(value) {
                return d * 1000
            }
            return nil
        }
    }
    open class SecondDateTransform: DateTransform {
        open override func transformFromJSON(_ value: Any?) -> Date? {
            var v: Any? = nil
            if let timeInt = value as? Double {
                v = timeInt
            }
            if let timeStr = value as? String, !timeStr.isEmpty {
                v = String(timeStr[timeStr.startIndex...timeStr.index(timeStr.endIndex, offsetBy: -3)])
            }
            
            return super.transformFromJSON(v)
        }
        open override func transformToJSON(_ value: Date?) -> Double? {
            if let d = super.transformToJSON(value) {
                return d
            }
            return nil
        }
    }
    open class BoolStringTransform: TransformType {
        public typealias Object = Bool
        public typealias JSON = String
        
        var trueString: String
        var falseString: String?
        public init(true string1: String, false string2: String? = nil) {
            self.trueString = string1
            self.falseString = string2
        }
        public func transformFromJSON(_ value: Any?) -> Bool? {
            if let v = value as? String {
                return v == trueString
            }
            return false
        }
        public func transformToJSON(_ value: Bool?) -> String? {
            if let v = value {
                return v ? trueString : falseString
            }
            return nil
        }
    }
}

