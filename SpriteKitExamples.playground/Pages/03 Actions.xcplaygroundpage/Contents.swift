//: [Previous](@previous)

/*:
 # 03 SpriteKit Actions
 We will build on the Red box example and demonstrate some actions.
 */

import SpriteKit
import PlaygroundSupport

/*:
 ---
 ### Create the SpriteKit View
 */
let view = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))

/*:
 ### Add it to the TimeLine
 */
PlaygroundPage.current.liveView = view


/*:
 ### Create the scene and add it to the view
 */
let scene = SKScene(size: CGSize(width: 1024, height: 768))
scene.scaleMode = .aspectFit
view.presentScene(scene)

/*:
 ### Create the Red Box, and add it to the scene
 */
let redBox = SKSpriteNode(color: .red, size:CGSize(width: 300, height: 300))
redBox.position = CGPoint(x: 512, y: 384)
scene.addChild(redBox)

/*:
 ### Create an array of actions
 */
let actions: [SKAction] = [
    // Move a node around
    SKAction.moveBy(x: 100, y: 100, duration: 0.5),
    SKAction.moveBy(x: -100, y: -100, duration: 0.5),

    // Change Node's Size
    SKAction.scale(to: 0.25, duration: 0.5),
    SKAction.scale(to: 2.5, duration: 0.5),
    SKAction.scale(to: 1.0, duration: 0.5),

    // Change Node's Alpha
    SKAction.fadeAlpha(to: 0.1, duration: 0.75),
    SKAction.fadeAlpha(to: 0.8, duration: 0.75),

    // Animate through textures
    SKAction.repeat(SKAction.animate(with: [SKTexture(image: #imageLiteral(resourceName: "goomba1.png")), SKTexture(image: #imageLiteral(resourceName: "goomba2.png"))], timePerFrame: 0.2, resize: false, restore: false), count: 5),

    // Colorizing
    SKAction.colorize(with: .green, colorBlendFactor: 1.0, duration: 0.5),
    SKAction.colorize(with: .purple, colorBlendFactor: 1.0, duration: 0.5),
    SKAction.colorize(with: .orange, colorBlendFactor: 1.0, duration: 0.5),
    SKAction.colorize(with: .brown, colorBlendFactor: 1.0, duration: 0.5),
    SKAction.colorize(with: .red, colorBlendFactor: 1.0, duration: 0.5),
    SKAction.colorize(withColorBlendFactor: 0, duration: 0.5),

    // Animate position along a path and follow orientation
    SKAction.follow(CGPath(roundedRect: CGRect(x: 0, y: 0, width: 200, height: 200), cornerWidth: 40, cornerHeight: 40, transform: nil), asOffset: true, orientToPath: true, duration: 3),

    // Custom Action: Reset the Node
    SKAction.run {
        redBox.texture = nil
        redBox.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
    }
]

/*:
 ### Now Animate the box, it's 1 line of code!!!
 */
redBox.run(SKAction.repeat(SKAction.sequence(actions), count: 5))


//: [Next](@next)
