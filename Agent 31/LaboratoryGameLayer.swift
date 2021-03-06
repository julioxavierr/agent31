//
//  LaboratoryGameLayer.swift
//  Agent 31
//
//  Created by Henrique Dutra on 20/10/15.
//  Copyright © 2015 Agent31. All rights reserved.
//

import SpriteKit

class LaboratoryGameLayer: SKNode {
    
    var agent31 : Agent?
    var placeHolder : SKSpriteNode?
    
    var desk : LabObject?
    var computer : LabObject?
    var gunDevelopmentCenter : LabObject?
    var television : LabObject?
    var trainingCenter : LabObject?
    var duelMode: LabObject?
    
    var tapObjectButton : SKSpriteNode?
    
    
    override init(){
        
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func putObjectPlaceHolder(){
        
        self.desk = LabObject(imageNamed: "placeHolderMesa" , groundPosition: CGPointMake(100,100))
        self.computer = LabObject(imageNamed: "placeHolderPC", groundPosition: CGPointMake(-150, 100))
        self.television = LabObject(imageNamed: "placeHolderTV", groundPosition: CGPointMake(-300, 100))
        self.trainingCenter = LabObject(imageNamed: "placeHolderTreinamento", groundPosition: CGPointMake(-450, 100))
        self.gunDevelopmentCenter = LabObject(imageNamed: "placeHolderMesaArmas", groundPosition: CGPointMake(250, 100))
        self.duelMode = LabObject(imageNamed: "placeHolderDuelMode", groundPosition: CGPointMake(-600, 100))
        
        
        self.addChild(desk!)
        self.addChild(computer!)
        self.addChild(television!)
        self.addChild(gunDevelopmentCenter!)
        self.addChild(trainingCenter!)
        self.addChild(duelMode!)
    }
    
    func putGameLayer(){
        
        self.putGround()
        self.putAgent()
        self.putObjectPlaceHolder()
        
    }
    
    
    
    func putGround(){
        
        let ground = Ground(size: CGSizeMake(5340, 100), position: CGPointMake(middleOfTheScreenPoint.x, -10), zPosition: 1)
        
        self.addChild(ground)
    }
    
    func putAgent(){
        agent31 = Agent(position: CGPointMake(middleOfTheScreenPoint.x, yPositionFloor - 50),withGun: false)
        self.addChild(agent31!)
        
    }
    
    func verifyObjectBalloon(obj: LabObject){
        if(distanceBetweenPoints(obj.position, second: (self.agent31?.position)!) < 100){
            obj.putBalloon()
        }else{
            obj.removeBalloon()
        }
    }
    
    func updateLabGameLayer(){
        self.verifyObjectBalloon(self.desk!)
        self.verifyObjectBalloon(self.computer!)
        self.verifyObjectBalloon(self.television!)
        self.verifyObjectBalloon(self.trainingCenter!)
        self.verifyObjectBalloon(self.gunDevelopmentCenter!)
        self.verifyObjectBalloon(self.duelMode!)
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        let node1: SKNode = contact.bodyA.node!
        let node2: SKNode = contact.bodyB.node!
        
        if(node1.isKindOfClass(Agent)){
            agent31?.didBeginContact(node2)
        }else if(node2.isKindOfClass(Agent)){
            agent31?.didBeginContact(node1)
        }
        
    }
    
}