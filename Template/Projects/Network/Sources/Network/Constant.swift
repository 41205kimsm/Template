//
//  Constant.swift
//  Network
//
//  Created by kimsoomin on 12/9/25.
//

import Foundation

public enum APIConstant {}

public extension APIConstant {
    static var baseUrl: String {
        return "https://sksdev.smartkumon.com/"
    }
}

public enum CommonConstant {
    static var paginationCount = 15
    static var defaultTimeoutInterval: TimeInterval = 10
    static var defaultRetryCount: Int = 3
}
