//: [Previous](@previous)

/*:
 # 06 Simple Physics Simulation
 In this example, we will create demonstrate a very simple physics simulation that demonstrates gravity.
 */

import SpriteKit
import PlaygroundSupport

/*:
 ----
 ### Extend SKTexture to create our ball texture
 */

extension SKTexture {
    static let ball = SKTexture(image: #imageLiteral(resourceName: "ball.png"))
}


/*:
 ---
 ### Create The view and scene
 Then set the PlaygroundPage's liveView to be the SKView.
 */
let view = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
let scene = SKScene(size: CGSize(width: 1024, height: 768))
scene.scaleMode = .aspectFit
scene.backgroundColor = .black
view.presentScene(scene)
PlaygroundPage.current.liveView = view


/*:
 ---
 ### Create The ground
 In this example, the ground is simply going to be a brown rectangle that has a physics body, however it is unaffected by gravity and it is non-dynamic.  We set it up like this so it will act as "the ground", meaning that it's "pinned down".
 */
let ground = SKSpriteNode(color: .brown, size: CGSize(width: 2048, height: 60))
ground.position = CGPoint(x: scene.frame.midX, y: scene.frame.minY)
ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
ground.physicsBody?.affectedByGravity = false
ground.physicsBody?.isDynamic = false
scene.addChild(ground)

/*:
 ---
 ### Helper function to create / setup a Ball
 This function creates the ball, puts it in a random position, picks a random color for it, and then creates and configures the physics body for it.
 */
func dropTheBall() {
    let ballNode = SKSpriteNode(texture: .ball)
    ballNode.color = .random
    ballNode.colorBlendFactor = 0.7
    let randomX = Int.random(max: Int(scene.frame.maxX))

    ballNode.position = CGPoint(x: CGFloat(randomX), y: scene.frame.maxY-30)
    ballNode.setScale(0.25)

    // Create the Physics Body (gravity is enabled by default)
    ballNode.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(ballNode.size.width/2))

    scene.addChild(ballNode)
}

/*:
 ---
 ### Create the spawning action
 This function creates the ball, puts it in a random position, picks a random color for it, and then creates and configures the physics body for it.
 */
let spawnBallAction = SKAction.customAction(withDuration: 5) { _  in
    dropTheBall()
}

/*:
 ---
 ### Queue up the spawning of the balls
 We create a sequence action that pauses for about a second after spawning the balls.
 We then ask the scene to repeat this action forever.
 */
let sequence = SKAction.sequence([spawnBallAction, SKAction.wait(forDuration: 1)])
scene.run(SKAction.repeatForever(sequence))

/*:
 ----
 ### Sequence Actions
 
 ![Sequences](sequences.png)
 */

//: [Next](@next)
