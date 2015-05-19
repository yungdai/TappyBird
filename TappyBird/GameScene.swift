//
//  GameScene.swift
//  TappyBird
//
//  Created by Yung Dai on 2015-05-19.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    // declariations of differenet elements on the screen
    var bird = SKSpriteNode()
    var pipeDown = SKTexture()
    var pipeUp = SKTexture()
    
    override func didMoveToView(view: SKView) {
        // setup the bird
        // bird texture for wing up and wing down
        var birdWingUp = SKTexture(imageNamed: "wingup")
        birdWingUp.filteringMode = .Nearest
        var birdWingDown = SKTexture(imageNamed: "wingdown")
        birdWingDown.filteringMode = .Nearest
        
        // place the bird onto the screen to the left side in the middle of the screen
        bird = SKSpriteNode(texture: birdWingUp)
        bird.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.6)
        
        // animate the bird
        var animation = SKAction.animateWithTextures([birdWingUp, birdWingDown], timePerFrame: 0.2)
        var makeBirdFlap = SKAction.repeatActionForever(animation)
        
        bird.runAction(makeBirdFlap)
        
        
        // bird physics......this will make the bird drop
        
//        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.height / 2.0)
//        bird.physicsBody?.dynamic = true
//        bird.physicsBody?.allowsRotation = false

        
        
        
        
        // set up the pipes
        pipeUp = SKTexture(imageNamed: "PipeUP")
        pipeDown = SKTexture(imageNamed: "PipeDown")
        
        // draw the bird onto the screen
        self.addChild(bird)
        
        
        
        
//        // create the ground
//        let groundTexture = SKTexture(imageNamed: "land")
//        groundTexture.filteringMode = .Nearest // shorter form for SKTextureFilteringMode.Nearest
//        
//        let moveGroundSprite = SKAction.moveByX(-groundTexture.size().width * 2.0, y: 0, duration: NSTimeInterval(0.02 * groundTexture.size().width * 2.0))
//        let resetGroundSprite = SKAction.moveByX(groundTexture.size().width * 2.0, y: 0, duration: 0.0)
//        let moveGroundSpritesForever = SKAction.repeatActionForever(SKAction.sequence([moveGroundSprite,resetGroundSprite]))
//        
//        for var i:CGFloat = 0; i < 2.0 + self.frame.size.width / ( groundTexture.size().width * 2.0 ); ++i {
//            let sprite = SKSpriteNode(texture: groundTexture)
//            sprite.setScale(2.0)
//            sprite.position = CGPointMake(i * sprite.size.width, sprite.size.height / 2.0)
//            sprite.runAction(moveGroundSpritesForever)
//
//            moving.addChild(sprite)
//        }
        
    }
    
    
    //  SKAction Object
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch : AnyObject in touches {
            let location = touch.locationInNode(self)
          /*
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)*/
            if self.nodeAtPoint(location) == self.bird {
                print("Bird touched")
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
