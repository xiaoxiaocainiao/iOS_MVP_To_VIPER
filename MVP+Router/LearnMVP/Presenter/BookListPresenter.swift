//
//  BookListPresenter.swift
//  LearnMVP
//
//  Created by 王雁 on 2018/4/24.
//  Copyright © 2018年 王雁. All rights reserved.
//

import UIKit

protocol BookListPresenter {
    func refreshData()
    func getBookCount() -> Int
    func getBook(indexPath: IndexPath) -> Book
    func showBookDetailAtIndex(indexPath: IndexPath)
}

class BookListPresenterIMP: BookListPresenter {
    
    private let mModel: BookListModel
    private weak var mView: BookListView?
    private let mRouter: BookListRouter
    
    //MARK: - initialization
    
    init(view: BookListView, model: BookListModel, router: BookListRouter) {
        mModel = model
        mView = view
        mRouter = router
    }
    
    //MARK: - BookListPresenter
    
    func refreshData() {
        mModel.getBooks()
        DispatchQueue.main.async {
            self.mView?.loadDataSuccess()
        }
    }
    
    func getBookCount() -> Int {
        return mModel.bookList.count
    }
    
    func getBook(indexPath: IndexPath) -> Book {
        return mModel.bookList[indexPath.row]
    }
    
    func showBookDetailAtIndex(indexPath: IndexPath) {
        let book = mModel.bookList[indexPath.row]
        mRouter.showBookDetail(book: book)
    }
}
