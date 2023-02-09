//
//  Network.swift
//  SampleProject
//
//  Created by ejsong on 2023/02/09.
//

import Moya

protocol Network {
    associatedtype Target: TargetType
    static func makeProvider() -> MoyaProvider<Target>
}

extension Network {
    static func makeProvider() -> MoyaProvider<Target> {
        return MoyaProvider<Target>(plugins: [])
    }
}
