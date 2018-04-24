//
//  BookListRouter.swift
//  LearnMVP
//
//  Created by 王雁 on 2018/4/24.
//  Copyright © 2018年 王雁. All rights reserved.
//

import UIKit

protocol BookListRouter {
    func showBookDetail(book: Book)
}

class BookListRouterIMP: BookListRouter {
    
    private var mNavigator: UINavigationController?
    init(navigator: UINavigationController?) {
        mNavigator = navigator
    }
    
    func showBookDetail(book: Book) {
        let vc = BookDetailViewController()
        mNavigator?.pushViewController(vc, animated: true)
    }
}
