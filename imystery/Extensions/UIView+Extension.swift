//
//  UIView+Extension.swift
//  HeyMail
//
//  Created by mufeng on 2018/7/20.
//  Copyright © 2018 heyooo. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    public func addSubviews(_ subviews: UIView...) -> UIView{
        subviews.forEach(addSubview)
        return self
    }
    
    @discardableResult
    public func addSubviews(_ subviews: [UIView]) -> UIView{
        subviews.forEach (addSubview)
        return self
    }
    
    public func removeAllSubviews() {
        while subviews.count != 0 {
            subviews.last?.removeFromSuperview()
        }
    }
    
}
