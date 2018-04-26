//
//  BookDetailPresenter.swift
//  LearnMVP
//
//  Created by 王雁 on 2018/4/24.
//  Copyright © 2018年 王雁. All rights reserved.
//

import UIKit

protocol BookDetailPresenter {
    
    func showBook()
}

class BookDetailPresenterIMP: BookDetailPresenter {
    private let mModel: BookDetailModel
    private weak var mView: BookDetailView?
    
    init(view: BookDetailView, model: BookDetailModel) {
       
        mModel = model
        mView = view
    }
    
    deinit {
        print("BookDetailPresenterIMP 销毁")
    }
    
    //MARK: - BookDetailPresenter
    func showBook() {
        mView?.showBook(bookName: mModel.getBook().name)
    }
}
