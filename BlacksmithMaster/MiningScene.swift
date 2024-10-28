//
//  MiningScene.swift
//  BlacksmithMaster
//
//  Created by Andrey Sandler on 17.10.2024.
//

import SpriteKit
import GameplayKit

class MiningScene: SKScene, ObservableObject {
    var counterLabel: SKLabelNode?
    var homeButton: SKSpriteNode?
    
    var counterText = 0
    
    override func didMove(to view: SKView) {
        counterLabel = self.childNode(withName: "counterLabel") as? SKLabelNode
        homeButton = self.childNode(withName: "homeButton") as? SKSpriteNode
        
        counterLabel?.text = String(counterText)
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = self.nodes(at: location)
            if touchedNode.first?.position == homeButton?.position {
                let newScene = GameScene(fileNamed: "GameScene")
                
                newScene?.counterText = counterText
                newScene?.scaleMode = .aspectFill
                scene?.view?.presentScene(newScene!, transition: .crossFade(withDuration: 1))
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
        // Called before each frame is rendered
    }
}
