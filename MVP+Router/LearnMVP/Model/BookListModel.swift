//
//  BookListModel.swift
//  LearnMVP
//
//  Created by 王雁 on 2018/4/24.
//  Copyright © 2018年 王雁. All rights reserved.
//

import UIKit

class BookListModel {
    
    var bookList: [Book] = []
    
    func getBooks() {
        let book0 = Book(name: "小学生十万个为什么", author: "未知")
        let book1 = Book(name: "˙悟空传", author: "今何在")
        bookList = [book0, book1]
    }
}
