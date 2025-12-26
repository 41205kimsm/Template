//
//  Date+Ex.swift
//  Extensions
//
//  Created by kimsoomin on 12/23/25.
//

import Foundation

extension Date {
    
    public func string(format: String) -> String {
        let df = DateFormatter()
        df.locale = .init(identifier: "ko_KR")
        df.dateFormat = format
        return df.string(from: self)
    }
}
