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
    
    override func didMove(to view: SKView) {
        anvil = self.childNode(withName: "anvil") as? SKSpriteNode
        ingot = self.childNode(withName: "ingot") as? SKSpriteNode
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
