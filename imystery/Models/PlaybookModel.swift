//
//  PlaybookModel.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/28.
//

import ObjectMapper

class PlaybookModel: Mappable {
    var name: String?
    var author: String?
    var studio: String?
    var publisher: String?
    var brief: String?
    var durationMinutes: Int?
    var wordCount: Int?
    var characterCount: Int?
    var isDetective: Bool?
    var isRepresentative: Bool?
    var isExclusive: Bool?
    var logicScore: Float?
    var storyScore: Float?
    var platforms: [String]?
    var tags: [String]?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        author <- map["author.name"]
        studio <- map["studio.name"]
        publisher <- map["publisher.name"]
        brief <- map["brief"]
        durationMinutes <- map["durationMinutes"]
        wordCount <- map["wordCount"]
        characterCount <- map["characterCount"]
        isDetective <- map["isDetective"]
        isRepresentative <- map["isRepresentative"]
        isExclusive <- map["isExclusive"]
        logicScore <- map["logicScore"]
        storyScore <- map["storyScore"]
        platforms <- map["platforms"]
        tags <- map["tags"]
    }
}
