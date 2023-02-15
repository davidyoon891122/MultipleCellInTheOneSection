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
    
    private let quotes: [QuotesModel] = [
        QuotesModel(
            writer: "Confucius",
            content: "When you have faults, do not fear to abandon them."
        ),
        QuotesModel(
            writer: "Confucius",
            content: "They must often change who would be constant in happiness or wisdom."
        ),
        QuotesModel(
            writer: "Lawana Blackwell",
            content: "Age is no guarantee of maturity. –"
        ),
        QuotesModel(
            writer: "Lawana Blackwell",
            content: "Youth isn’t always all it’s touted to be. "
        ),
        QuotesModel(
            writer: "Maya Angelou",
            content: "You will face many defeats in life, but never let yourself be defeated. –"
        ),
        QuotesModel(
            writer: "Nelson Mandela",
            content: "The greatest glory in living lies not in never falling, but in rising every time we fall."
        ),
        QuotesModel(
            writer: "Helen Keller",
            content: "Life is either a daring adventure or nothing at all."
        ),
        QuotesModel(
            writer: "Zeno",
            content: "The goal of life is living in agreement with nature."
        ),
        QuotesModel(
            writer: "Mark Twain",
            content: "All you need in this life is ignorance and confidence, then success is sure. "
        ),
        QuotesModel(
            writer: "Kamal Ravikant",
            content: "Life is from the inside out. When you shift on the inside, life shifts on the outside."
        )
    ]
    
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
        
        let quote = quotes[indexPath.item]
        cell.setupCell(title: quote.writer, content: quote.content)
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
