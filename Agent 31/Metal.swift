//
//  Metal.swift
//  Agent 31
//
//  Created by Julio Xavier on 23/11/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class Metal: GameObject {
    
    var value: Int
    
    init(position: CGPoint){
        
        // Randomize a value between 10 and 1
        self.value = Int(arc4random() % 10 + 1)
        
        super.init(imageName: "Metal", position: position, zPosition: zPositionsCity.RESOURCE.rawValue)
        
        attributes()
        basicProcedures()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func generatePhysicsBody() -> SKPhysicsBody {
        let physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.size.width/2, self.size.height/2))
        
        physicsBody.categoryBitMask = ColliderType.Metal.rawValue
        physicsBody.contactTestBitMask = ColliderType.Agent.rawValue
        physicsBody.collisionBitMask = ColliderType.Ground.rawValue
        
        physicsBody.allowsRotation = false
        physicsBody.mass = 0.1
        
        return physicsBody
    }
    
    func basicProcedures(){
        
        // random between left and right direction
        let dx = CGFloat(random() % 40 - 40)
        self.physicsBody?.applyImpulse(CGVectorMake(dx, 200))
        
        self.runAction(SKAction.waitForDuration(8.0), completion: {
            self.removeFromParent()
        })
    }
    
    func attributes(){
        self.setScale(0.5)
    }
    
    override func didBeginContact(contactedNode: SKNode) {
        if contactedNode .isKindOfClass(Agent){
            ResourcesData.sharedInstance.metal += self.value
            self.removeFromParent()
        }
    }
    
}
