//
//  Memo.swift
//  myMemo
//
//  Created by 梁佳玉 on 16/8/3.
//  Copyright © 2016年 梁佳玉. All rights reserved.
//

import Foundation

class cMemo {
    var content     : String    = ""
    var priority    : Int       = 0
    var time        : NSDate    = NSDate()
    var description : String    = ""

    
    init(content: String, date: NSDate = NSDate()){
        self.content = content
        self.time = date
    }
}