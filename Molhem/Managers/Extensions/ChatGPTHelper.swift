//
//  ChatGPTHelper.swift
//  Molhem
//
//  Created by eman alejilah on 23/10/1444 AH.
//

import Foundation
import ChatGPTSwift

struct ChatGPTHelper {
    private static var _api: ChatGPTAPI?
    
    static var api: ChatGPTAPI {
        if _api == nil {
            renew()
        }
        
        return _api!
    }
    
    static func renew() {
        _api = ChatGPTAPI(apiKey: "")
    }
    
//    static let MessagePlaceholder = "💭thinking"
    
    static let MessagePlaceholder = ""
    
    static let ChatErrorPrefix    = "[an error has occurred]"
    static let ChatStopTips       = "[ended]"
}

