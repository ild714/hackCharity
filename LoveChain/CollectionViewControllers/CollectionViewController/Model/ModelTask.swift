//
//  modelTask.swift
//  LoveChain
//
//  Created by Ildar on 2/7/21.
//

import Foundation

enum Type {
    case process
    case done
    case processRealiation
}

struct ModelTask {
    
    var time: String
    var title: String
    var status: String
    var type: Type
}
