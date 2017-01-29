//: [Previous](@previous)

/*:
 # 04 Animate the Helicopter
 We will animate rotor in the helicopter using an SKAction.  To reduce the amount of code, I've created a custom Helicopter class that extends SKSpriteNode.
 
 ## The Helicopter interface looks like this:
 ```swift
 public class Helicopter : SKSpriteNode {
    /// Expose the main Rotor as a Node
    public let rotor1Node: SKSpriteNode
    public init()
 }
 ```
 */


import SpriteKit
import PlaygroundSupport

/*:
 ---
 ### Create The view and scene
 Then set the PlaygroundPage's liveView to be the SKView.
 */
let view = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
let scene = SKScene(size: CGSize(width: 1024, height: 768))
scene.scaleMode = .aspectFit
view.presentScene(scene)
PlaygroundPage.current.liveView = view

/*:
 ---
 ### Create The Helicopter and add it to the scene
 */
let helicopter = Helicopter()
helicopter.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
scene.addChild(helicopter)
helicopter.setScale(3.0)

/*:
 ---
 ### Create The rotate action and animate it
 */
let rotateAction = SKAction.rotate(byAngle: CGFloat(1080/M_PI), duration: 1.5)
helicopter.rotor1Node.run(rotateAction)


//: [Next](@next)
