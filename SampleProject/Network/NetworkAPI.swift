//
//  NetworkManager.swift
//  SampleProject
//
//  Created by ejsong on 2023/02/09.
//

import Foundation
import SwiftyJSON
import Moya

struct NetworkAPI : Network {
    
    typealias Target = DefaultTargetType
    
    static func getNickName(memNo: String, completion: @escaping (Result<String, Error>) -> Void) {
        makeProvider().request(.reqNickaname(memNo)) { result in
            switch result {
            case let .success(response):
                do {
                    let list = try JSONDecoder().decode(MemberData.self, from: response.data)
                    completion(.success(list.data?.nickName ?? ""))
                }catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
                
            }
        }
    }
}
