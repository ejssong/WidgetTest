//
//  BaseTargetType.swift
//  SampleProject
//
//  Created by ejsong on 2023/02/09.
//

import Foundation
import Moya

protocol BaseTargetType: TargetType {
    
}

extension BaseTargetType {
    public var headers: [String: String]? {
        return ["Content-type": "application/json; charset=UTF-8"]
    }
}


public enum DefaultTargetType {
    case reqNickaname(String)
}

extension DefaultTargetType: BaseTargetType {
    public var baseURL: URL {
        return URL(string: NetworkURL.URL)!
    }
    
    public var path: String {
        switch self {
        case .reqNickaname:
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .reqNickaname:
            return .get
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .reqNickaname(let data):
            return .requestParameters(parameters: ["memNo" : data], encoding: URLEncoding.default)
        }
    }
    
}
