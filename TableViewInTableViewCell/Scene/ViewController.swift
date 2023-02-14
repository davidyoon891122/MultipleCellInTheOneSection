//
//  ViewController.swift
//  TableViewInTableViewCell
//
//  Created by jiwon Yoon on 2023/02/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(
            MainTableViewCell.self,
            forCellReuseIdentifier: MainTableViewCell.identifier
        )
        
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 10
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainTableViewCell.identifier,
            for: indexPath
        ) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.setupCell(title: "test", content: "test")
        return cell
    }
}

extension ViewController: UITableViewDelegate {
}

private extension ViewController {
    func setupViews() {
        view.addSubview(mainTableView)
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
