//
//  Dictionary+Extension.swift
//  ForexQuotes
//
//  Created by Доловсков Владислав on 09/02/2019.
//  Copyright © 2019 Доловсков Владислав. All rights reserved.
//

import Foundation

extension Dictionary where Key:StringProtocol, Value: StringProtocol {
    
    func stringFromHttpParameters() -> String {
        let parameterArray = self.map { (key, value) -> String in
            let keyStr = key as? String ?? ""
            let valusStr = value as? String ?? ""
            return "\(keyStr)=\(valusStr)"
        }
        
        return parameterArray.joined(separator: "&")
    }
}

extension Double {
    func toString() -> String {
        let nf = NumberFormatter()
        nf.numberStyle = NumberFormatter.Style.decimal
        nf.maximumFractionDigits = 5
        let str = nf.string(from: NSNumber(value: self)) ?? ""
        
        return str.replacingOccurrences(of: ",", with: ".")
    }
}
