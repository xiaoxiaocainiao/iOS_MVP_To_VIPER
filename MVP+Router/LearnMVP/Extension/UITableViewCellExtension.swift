//
//  UITableViewCellExtension.swift
//  LearnMVP
//
//  Created by 王雁 on 2018/4/24.
//  Copyright © 2018年 王雁. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var cellIdentifier: String {
        get {
            return String(describing: self)
        }
    }
}
