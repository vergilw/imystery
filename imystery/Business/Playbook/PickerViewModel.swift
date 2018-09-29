//
//  PickerViewModel.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/29.
//

import Foundation

class PickerViewModel {
    
    var pickerMode: PlaybookPickerMode?
    
    var authors = [AuthorModel]()
    var studios = [StudioModel]()
    var platforms = [PlatformModel]()
    var genders = ["男", "女", "未知"]
}
