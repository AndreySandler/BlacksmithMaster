//
//  WerehouseScene.swift
//  BlacksmithMaster
//
//  Created by Andrey Sandler on 28.10.2024.
//

import SpriteKit
import GameplayKit

class WarehouseScene: SKScene {
    
    // MARK: - Sprite Kit Nodes
    var homeButton: SKSpriteNode?
    var miningButton: SKSpriteNode?
    
    // MARK: - SpriteKit Textures
    var ingotTexture: SKTexture?
    
    // MARK: - Public Properties
    var counterText = 0
    
    override func didMove(to view: SKView) {
        homeButton = self.childNode(withName: "homeButton") as? SKSpriteNode
        miningButton = self.childNode(withName: "miningButton") as? SKSpriteNode
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            
            if touchedNode.first?.position == miningButton?.position {
                let miningScene = MiningScene(fileNamed: "MiningScene")
                
                miningScene?.ingotTexture = ingotTexture
                miningScene?.counterText = counterText
                miningScene?.scaleMode = .aspectFill
                scene?.view?.presentScene(miningScene!, transition: .fade(withDuration: 1))
            } else if touchedNode.first?.position == homeButton?.position {
                let homeScene = GameScene(fileNamed: "GameScene")
                
                homeScene?.ingot.texture = ingotTexture
                homeScene?.counterText = counterText
                homeScene?.scaleMode = .aspectFill
                scene?.view?.presentScene(homeScene!, transition: .fade(withDuration: 1))
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

