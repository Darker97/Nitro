//
//  BUSPLAN_STRUCKT.swift
//  Nitro
//
//  Created by Christian Baltzer on 19.04.19.
//  Copyright © 2019 Christian Baltzer. All rights reserved.
//

import Foundation

struct BusplanStruc: Codable{
    var type, code, text: String
    var journey: [Journey]
    var noj: Int
}

struct Journey: Codable {
    let lfn: Int
    let time, date: String
    let rtInfo: RtInfo
    let mot: Mot
    let passList: String?
    let direction: String
    let track: String?
    let him: [Him]?
}

struct Him: Codable {
    var head: String
}

struct Mot: Codable {
    var icon: String?
    var name: String
}

struct RtInfo: Codable {
    var status: String
}
