//
//  HomeViewModel.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/29.
//

import Foundation
import SwiftyJSON
import ObjectMapper

class HomeViewModel {
    var playbookModels: [PlaybookModel]?
    
    func fetchPlaybooks(completion: @escaping (Bool)->Void) {
        PlaybookProvider.request(.playbooks(offset: 20, limit: 20)) { result in
            switch result {
            case let .success(response):
                if response.statusCode == 200 {
                    self.playbookModels = [PlaybookModel]()
                    let results = try! JSON(data: response.data)
                    let models = Mapper<PlaybookModel>().mapArray(JSONArray: results["results"].arrayObject as! [[String : Any]])
                    self.playbookModels?.append(contentsOf: models)
                    completion(false)
                    print(results)
                } else {
                    let error = try? JSON(data: response.data)
                    //                    let errorCode = error?["code"].stringValue
                    print(error)
                }
            case let .failure(error):
                //                HUDService.sharedInstance.show(targetView: self.view, text: error.localizedDescription)
                print("failure")
            }
        }
    }
}
