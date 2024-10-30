//
//  GameScene.swift
//  BlacksmithMaster
//
//  Created by Andrey Sandler on 03.10.2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // MARK: - SpriteKit Nodes
    var anvil: SKSpriteNode?
    var miningButton: SKSpriteNode?
    var warehouseButton: SKSpriteNode?
    var counterLabel: SKLabelNode?
    
    // MARK: - Public properties
    var counterText = 0
    let ingot = SKSpriteNode(imageNamed: "ingot")
    
    
    // MARK: - Override functions
    override func didMove(to view: SKView) {
        anvil = self.childNode(withName: "anvil") as? SKSpriteNode
        miningButton = self.childNode(withName: "miningButton") as? SKSpriteNode
        warehouseButton = self.childNode(withName: "warehouseButton") as? SKSpriteNode
        counterLabel = self.childNode(withName: "counterLabel") as? SKLabelNode
        
        ingot.size = CGSize(width: 300, height: 128)
        ingot.zPosition = 3
        counterLabel?.text = String(counterText)
        ingot.position = CGPoint(x: 0, y: 45)
        self.addChild(ingot)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            
            if touchedNode.first?.position == miningButton?.position {
                let miningScene = MiningScene(fileNamed: "MiningScene")
                
                miningScene?.counterText = counterText
                miningScene?.scaleMode = .aspectFit
                scene?.view?.presentScene(miningScene!, transition: .fade(withDuration: 1))
            } else if touchedNode.first?.position == warehouseButton?.position {
                let warehouseScene = WarehouseScene(fileNamed: "WarehouseScene")
                
                warehouseScene?.counterText = counterText
                warehouseScene?.scaleMode = .aspectFill
                scene?.view?.presentScene(warehouseScene!, transition: .fade(withDuration: 1))
            } else {
                counterText += 1
                counterLabel?.text = String(counterText)
                if counterText >= 10 && counterText <= 29 {
                    ingot.run(SKAction.setTexture(SKTexture(imageNamed: "ingotOne")))
                    ingot.size = CGSize(width: 300, height: 128)
                } else if counterText >= 30 && counterText <= 49 {
                    ingot.run(SKAction.setTexture(SKTexture(imageNamed: "ingotTwo")))
                    ingot.size = CGSize(width: 300, height: 128)
                } else if counterText >= 50 && counterText <= 99 {
                    ingot.run(SKAction.setTexture(SKTexture(imageNamed: "ingotThree")))
                    ingot.size = CGSize(width: 300, height: 128)
                } else if counterText >= 100 {
                    ingot.run(SKAction.setTexture(SKTexture(imageNamed: "sword")))
                    ingot.size = CGSize(width: 600, height: 128)
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
