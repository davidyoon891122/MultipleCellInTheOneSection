//
//  CommentModel.swift
//  TableViewInTableViewCell
//
//  Created by jiwon Yoon on 2023/02/15.
//

import Foundation

struct CommentModel {
    let creator: String
    let content: String
    let date: String
    let reply: [ReplyModel]
}

struct ReplyModel {
    let creator: String
    let content: String
    let date: String
}
