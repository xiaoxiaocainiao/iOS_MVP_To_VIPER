//
//  BookDetailViewController.swift
//  LearnMVP
//
//  Created by 王雁 on 2018/4/24.
//  Copyright © 2018年 王雁. All rights reserved.
//

import UIKit

struct BookDetailViewConfig {
    let book: Book
}

class BookDetailViewController: UIViewController, BookDetailView {
    
    var config: BookDetailViewConfig?
    
    private var presenter: BookDetailPresenter?
    
    private let bookNameLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
        
        setupPresenter()
        
        presenter?.showBook()
    }
    
    deinit {
        print("BookDetailViewController 销毁. \(String(describing: bookNameLabel.text))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupUI() {
        self.title = "图书详情"
        view.backgroundColor = UIColor.brown
        
        view.addSubview(bookNameLabel)
        bookNameLabel.frame = CGRect(x: 100, y: 250, width: 200, height: 50)
        bookNameLabel.textColor = UIColor.white
        bookNameLabel.backgroundColor = UIColor.green
    }
    
    private func setupPresenter() {
        guard let bookValue = config?.book else {
            print("config 不存在, 初始化失败.")
            return
        }
        let model = BookDetailModel(book: bookValue)
        presenter = BookDetailPresenterIMP(view: self, model: model)
    }
    
    //MARK: - BookDetailView
    
    func showBook(bookName: String) {
        bookNameLabel.text = bookName
    }

}
