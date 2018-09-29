//
//  AuthorModel.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/29.
//

import ObjectMapper

class AuthorModel: Mappable {
    
    var id: Int?
    var name: String?
    var brief: String?
    var gender: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        brief <- map["brief"]
        gender <- map["gender"]
    }
}
