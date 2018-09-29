//
//  SeparatorImgView.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/29.
//

import UIKit

class SeparatorImgView: UIImageView {

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context!.setLineWidth(2.0)
        context!.setStrokeColor(UIColor.red.cgColor)
        context?.move(to: CGPoint(x: 0, y: self.frame.size.height))
        context?.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
        context!.strokePath()
    }
}
