//
//  LaboratoryBackgroundLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryBackgroundLayer: SKNode {

    var backgroundLaboratory : SKSpriteNode
    
    override init() {
        
        self.backgroundLaboratory = createSpriteNode("backgroundLabTest.png", zPosition: 0, name: "backgroundLaboratory")
        
        super.init()
        
        self.addChild(self.backgroundLaboratory)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
