//
//  Extension+UIView.swift
//  MarvelApp
//
//  Created by Randy Efan Jayaputra on 11/08/22.
//

import SnapKit
import UIKit

extension UIView {
    public func constraintEdges(to frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)) {
        self.snp.makeConstraints { (make) in
            make.left.equalTo(frame.origin.x)
            make.top.equalTo(frame.origin.y)
            make.width.equalTo(frame.width)
            make.height.equalTo(frame.height)
        }
    }
}
