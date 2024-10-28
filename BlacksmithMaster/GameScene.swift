//
//  GameScene.swift
//  BlacksmithMaster
//
//  Created by Andrey Sandler on 03.10.2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var anvil: SKSpriteNode?
    var ingot: SKSpriteNode?
    var miningButton: SKSpriteNode?
    var counterLabel: SKLabelNode?
    
    var counterText = 0
    
    override func didMove(to view: SKView) {
        anvil = self.childNode(withName: "anvil") as? SKSpriteNode
        ingot = self.childNode(withName: "ingot") as? SKSpriteNode
        miningButton = self.childNode(withName: "miningButton") as? SKSpriteNode
        counterLabel = self.childNode(withName: "counterLabel") as? SKLabelNode
        
        counterLabel?.text = String(counterText)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            if touchedNode.first?.position == miningButton?.position {
                let newScene = MiningScene(fileNamed: "MiningScene")
                
                newScene?.counterText = counterText
                newScene?.scaleMode = .aspectFill
                scene?.view?.presentScene(newScene!, transition: .fade(withDuration: 1))
            } else {
                counterText += 1
                counterLabel?.text = String(counterText)
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
