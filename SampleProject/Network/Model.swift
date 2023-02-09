//
//  Model.swift
//  SampleProject
//
//  Created by ejsong on 2023/02/09.
//

import Foundation

struct MemberData : Codable {
    var result : String
    var message : String?
    var data : MemberInfo?
    
    enum CodingKeys : String, CodingKey {
        case result
        case message
        case data
    }
    
    init(frame decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = (try? container.decode(MemberInfo.self, forKey: .data)) ?? nil
        self.message = (try? container.decode(String.self, forKey: .message)) ?? ""
        self.result = (try? container.decode(String.self, forKey: .result)) ?? ""
        
    }
}


struct MemberInfo : Codable {
    var thumbnail : String
    var nickName : String
    var sex : String
    var memNo : String
    var age : String
    var memID : String
    
    enum CodingKeys: String, CodingKey {
        case thumbnail
        case nickName
        case sex
        case memNo
        case age
        case memID = "memId"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.thumbnail = (try? container.decode(String.self, forKey: .thumbnail)) ?? ""
        self.nickName = (try? container.decode(String.self, forKey: .nickName)) ?? ""
        self.sex      = (try? container.decode(String.self, forKey: .sex)) ?? ""
        self.memNo    = (try? container.decode(String.self, forKey: .memNo)) ?? ""
        self.age      = (try? container.decode(String.self, forKey: .age)) ?? ""
        self.memID    = (try? container.decode(String.self, forKey: .memID)) ?? ""
    }
    
}
