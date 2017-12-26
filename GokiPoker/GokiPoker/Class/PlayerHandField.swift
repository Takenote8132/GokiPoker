//
//  PlayerHandField.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import Foundation

class PlayerHandField: CardFieldProtcol {
    
    var cardsInField: [Card] = []
    var index: Int
    
    required init(index: Int){
        self.index = index
    }
}
