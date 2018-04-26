//
//  BookDetailModel.swift
//  LearnMVP
//
//  Created by 王雁 on 2018/4/24.
//  Copyright © 2018年 王雁. All rights reserved.
//

import Foundation

class BookDetailModel {
    
    var mBook: Book
    
    init(book: Book) {
        mBook = book
    }
    
    func getBook() -> Book {
        return mBook
    }
}
