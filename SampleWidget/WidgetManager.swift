//
//  NetworkManager.swift
//  SampleProject
//
//  Created by ejsong on 2023/02/09.
//

import Foundation

class WidgetManager {
    private init() { }
    static let shared: WidgetManager = .init()
    
    func getNickName(memNo: String, completion: @escaping (String) -> Void) {
        
        NetworkAPI.getNickName(memNo: memNo, completion: { result in
            do {
                let nickName = try result.get()
                completion(nickName)
            }catch {
                completion("")
            }
        })
    }
}
