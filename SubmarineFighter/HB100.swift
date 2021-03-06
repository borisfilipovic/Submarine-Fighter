//
//  HB100.swift
//  SubmarineFighter
//
//  Created by Boris Filipović on 11/29/15.
//  Copyright © 2015 devsonmars. All rights reserved.
//

import SpriteKit

class HB100: Entity {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(entityPosition: CGPoint) {
        let entityTexture = HB100.generateTexture()!
        super.init(position: entityPosition, texture: entityTexture)
        name = "HB100"
    }
    
    // Because entity returns nil when generateTexture func is called, we have to use this function to create singleton.
    override class func generateTexture() -> SKTexture? {
        
        // 1. Struct.
        struct SharedTexture {
            static var texture = SKTexture()
            static var onceToken: dispatch_once_t = 0
        }
        
        dispatch_once(&SharedTexture.onceToken, {
            // 2.
            let healthBar = SKSpriteNode(imageNamed: "Healthbar100")
            healthBar.name = "HB100"
            healthBar.size = CGSize(width: 300, height: 15)
            
            // 3.
            let textureView = SKView()
            SharedTexture.texture = textureView.textureFromNode(healthBar)!
            SharedTexture.texture.filteringMode = .Nearest
        })
        
        return SharedTexture.texture
        
    }
    
}
