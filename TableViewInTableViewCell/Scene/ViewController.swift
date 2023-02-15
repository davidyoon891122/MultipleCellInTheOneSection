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
            CommentCell.self,
            forCellReuseIdentifier: CommentCell.identifier
        )
        
        tableView.register(
            ReplyCell.self,
            forCellReuseIdentifier: ReplyCell.identifier
        )
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    private let comments: [CommentModel] = [
        CommentModel(
            creator: "Confucius",
            content: "When you have faults, do not fear to abandon them.",
            date: "2023",
            reply: [
                ReplyModel(creator: "reply", content: "They must often change who would be constant in happiness or wisdom.", date: "2023"),
                ReplyModel(creator: "reply", content: "They must often change who would be constant in happiness or wisdom.", date: "2023")
            ]
        ),
        CommentModel(
            creator: "Confucius",
            content: "When you have faults, do not fear to abandon them.",
            date: "2023",
            reply: [
                
            ]
        ),
        CommentModel(
            creator: "Confucius",
            content: "When you have faults, do not fear to abandon them.",
            date: "2023",
            reply: [
                ReplyModel(creator: "reply", content: "Age is no guarantee of maturity. –", date: "2023")
            ]
        ),
        CommentModel(
            creator: "Confucius",
            content: "When you have faults, do not fear to abandon them.",
            date: "2023.01.20",
            reply: [
                ReplyModel(creator: "reply", content: "Youth isn’t always all it’s touted to be. ", date: "2023.03.05"),
                ReplyModel(creator: "reply", content: "You will face many defeats in life, but never let yourself be defeated. –", date: "2023.03.12"),
                ReplyModel(creator: "reply", content: "The greatest glory in living lies not in never falling, but in rising every time we fall.", date: "2023.03.25"),
                ReplyModel(creator: "reply", content: "Life is either a daring adventure or nothing at all.", date: "2023.03.08"),
                ReplyModel(creator: "reply", content: "The goal of life is living in agreement with nature.", date: "2023.03.05"),
                ReplyModel(creator: "reply", content: "Life is from the inside out. When you shift on the inside, life shifts on the outside.", date: "2023.03.15")
            ]
        )
    ]
    
    private var dataSource = [OnlyCellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        self.refresh()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return dataSource.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        switch self.dataSource[indexPath.row] {
        case .comment(profileImage: let profileImage, titleText: let titleText, descriptionText: let descriptionText):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier, for: indexPath) as? CommentCell else { return UITableViewCell() }
            cell.setupCell(title: titleText, content: descriptionText)
            return cell
        case .reply(title: let title, content: let content):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ReplyCell.identifier, for: indexPath) as? ReplyCell else { return UITableViewCell() }
            cell.setupCell(title: title, content: content)
            return cell
        }
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
    
    func refresh() {
        comments.forEach {
            let comment = OnlyCellModel.comment(profileImage: nil, titleText: $0.creator, descriptionText: $0.content)
            self.dataSource.append(comment)
            
            $0.reply.forEach {
                self.dataSource.append(OnlyCellModel.reply(title: $0.creator, content: $0.content))
            }
            
        }
        
//        self.dataSource = [
//            .comment(profileImage: nil, titleText: "Kamal Ravikant", descriptionText: "Life is from the inside out. When you shift on the inside, life shifts on the outside."),
//            .reply(title: "Reply", content: "ReplyTest"),
//            .reply(title: "reply", content: "replySecond"),
//            .comment(profileImage: nil, titleText: "Kamal Ravikant", descriptionText: "Life is from the inside out. When you shift on the inside, life shifts on the outside."),
//            .reply(title: "Reply", content: "ReplyTest"),
//            .reply(title: "reply", content: "replySecond"),
//            .comment(profileImage: nil, titleText: "Kamal Ravikant", descriptionText: "Life is from the inside out. When you shift on the inside, life shifts on the outside."),
//            .reply(title: "Reply", content: "ReplyTest"),
//            .reply(title: "reply", content: "replySecond"),
//            .comment(profileImage: nil, titleText: "Kamal Ravikant", descriptionText: "Life is from the inside out. When you shift on the inside, life shifts on the outside."),
//            .reply(title: "Reply", content: "ReplyTest"),
//            .reply(title: "reply", content: "replySecond"),
//            .comment(profileImage: nil, titleText: "Kamal Ravikant", descriptionText: "Life is from the inside out. When you shift on the inside, life shifts on the outside."),
//            .reply(title: "Reply", content: "ReplyTest"),
//            .reply(title: "reply", content: "replySecond"),
//        ]
        
        self.mainTableView.reloadData()
    }
}
