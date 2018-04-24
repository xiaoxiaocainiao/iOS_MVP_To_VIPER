//
//  ViewController.swift
//  LearnMVP
//
//  Created by 王雁 on 2018/4/24.
//  Copyright © 2018年 王雁. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController, BookListView, UITableViewDataSource, UITableViewDelegate {
    
    private var presenter: BookListPresenter?
    private var mTableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupPresenter()
        setupUI()
        
        presenter?.refreshData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - setup all parts
    
    private func setupPresenter() {
        let model = BookListModel()
        let router = BookListRouterIMP(navigator: self.navigationController)
        presenter = BookListPresenterIMP(view: self, model: model, router: router)
    }

    private func setupUI() {
        self.title = "图书列表"
        mTableView.frame = view.bounds
        view.addSubview(mTableView)
        mTableView.register(BookListTableViewCell.self, forCellReuseIdentifier: BookListTableViewCell.cellIdentifier)
        mTableView.delegate = self
        mTableView.dataSource = self
        mTableView.tableFooterView = UIView()
    }
    
    //MARK: - BookListView
    func loadDataSuccess() {
        mTableView.reloadData()
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getBookCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookListTableViewCell.cellIdentifier, for: indexPath) as? BookListTableViewCell else {
            
            return UITableViewCell()
        }
        cell.config(presenter?.getBook(indexPath: indexPath))
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showBookDetailAtIndex(indexPath: indexPath)
    }
}

