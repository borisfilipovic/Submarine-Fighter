//
//  Boss3.swift
//  SubmarineFighter
//
//  Created by Boris Filipović on 11/26/15.
//  Copyright © 2015 devsonmars. All rights reserved.
//

import SpriteKit

class Boss3: Entity {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(entityPosition: CGPoint, viewSize: CGSize) {
        let entityTexture = Boss3.generateTexture()!
        super.init(position: entityPosition, texture: entityTexture)
        name = "boss3"
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
            let boss1 = SKSpriteNode(imageNamed: "Boss3-1")
            boss1.name = "boss3"
            
            // 3.
            let textureView = SKView()
            SharedTexture.texture = textureView.textureFromNode(boss1)!
            SharedTexture.texture.filteringMode = .Nearest
        })
        
        return SharedTexture.texture
    }
}
