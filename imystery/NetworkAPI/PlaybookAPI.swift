//
//  PlaybookAPI.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/28.
//

import Foundation
import Moya

let PlaybookProvider = MoyaProvider<PlaybookAPI>()

enum PlaybookAPI {
    case playbooks(offset: Int, limit: Int)
}

extension PlaybookAPI: TargetType {
    
    public var baseURL: URL {
        return URL(string: ServerHost)!
    }
    
    public var path: String {
        switch self {
        case .playbooks(offset: _, limit: _):
            return "/plays/"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .playbooks:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case let .playbooks(offset, limit):
            return .requestParameters(parameters: ["offset": offset, "limit": limit, "format": "json"], encoding: URLEncoding.default)
        }
    }
    
    var validationType: ValidationType {
        return .none
    }
    
    var headers: [String: String]? {
        return nil
    }
}
