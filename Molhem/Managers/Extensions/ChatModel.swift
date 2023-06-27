//
//  ChatModel.swift
//  Molhem
//
//  Created by eman alejilah on 23/10/1444 AH.
//

import Foundation

struct ChatModel: Identifiable {
    var id = UUID()
    
    var isGPT: Bool
    var message: String
}

extension ChatEntity {
    var toModel: ChatModel {
        ChatModel(id: id ?? UUID(), isGPT: isAI, message: message ?? "")
    }
}
