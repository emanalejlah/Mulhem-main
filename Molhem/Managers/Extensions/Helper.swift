//
//  Helper.swift
//  Molhem
//
//  Created by eman alejilah on 18/10/1444 AH.
//

import SwiftUI
import OpenAIKit


public let apiKey = ""
public let organization = ""


let configuration = Configuration(apiKey: apiKey, organization: organization)
let openAIClient = Client(httpClient: .init(eventLoopGroupProvider: .createNew), configuration: configuration)

