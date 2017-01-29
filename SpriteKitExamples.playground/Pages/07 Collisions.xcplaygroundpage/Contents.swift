//: [Previous](@previous)

/*:
 # 07 Physics Collision simulation
 In this example, we will create demonstrate physics collisions
 */

import SpriteKit
import PlaygroundSupport


/*:
 ---
 ### Create The view and scene
 Then set the PlaygroundPage's liveView to be the SKView.
 */
let view = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
let scene = GameScene(size: CGSize(width: 1024, height: 768))
scene.scaleMode = .aspectFit
scene.backgroundColor = .black
view.presentScene(scene)
PlaygroundPage.current.liveView = view
PlaygroundPage.current.needsIndefiniteExecution = true

// Toggle this on and off to show / hide the physics bodies
// view.showsPhysics = true

/*:
 ---
 ### Implement the Contact Delegate and enable collisions
 */
extension GameScene: SKPhysicsContactDelegate {

    public func didBegin(_ contact: SKPhysicsContact) {
        guard let goomba = contact.bodyA.node as? Goomba ?? contact.bodyB.node as? Goomba else {
            return
        }
        guard let _ = contact.bodyA.node as? Ball ?? contact.bodyB.node as? Ball else {
            return
        }

        goomba.die()

        for ball in balls {
            ball.removeAllActions()
            ball.agent.delegate = nil
        }
    }
}

// Set the contactDelegate in the Scene's Physics World
scene.physicsWorld.contactDelegate = scene

//: [Next](@next)
