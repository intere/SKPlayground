//: [Previous](@previous)

/*:
 # 02 Nested SpriteKit Nodes
 We will create a simple Helicopter sprite using nested nodes.
 */

import SpriteKit
import PlaygroundSupport

/*:
 ---
 ### Extend SKTexture to create the textures
 */
extension SKTexture {
    static let body = SKTexture(image: #imageLiteral(resourceName: "Body.png"))
    static let missiles = SKTexture(image: #imageLiteral(resourceName: "Missiles.png"))
    static let rotor1 = SKTexture(image: #imageLiteral(resourceName: "Rotor1.png"))
    static let rotor2 = SKTexture(image: #imageLiteral(resourceName: "Rotor2.png"))
}

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
 ### Create the Root Node
 The node is structured this way:

 ![Node Tree](Nodes.png "Node Structure")
 */
let rootNode = SKSpriteNode(color: .white, size: CGSize(width: 200, height: 200))
rootNode.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
rootNode.setScale(3.0)

/*:
 ### Create the Missile node
 ![Missiles](Missiles.png)
 */
let missilesNode = SKSpriteNode(texture: .missiles)
missilesNode.position = CGPoint(x: 0, y: 30)
missilesNode.zPosition = 0

/*:
 ### Create the Body node
 ![Body](Body.png)
 */
let bodyNode = SKSpriteNode(texture: .body)
bodyNode.zPosition = 5

/*:
 ### Create the main Rotor node
 ![Rotor1](Rotor1.png)
 */
let rotor1Node = SKSpriteNode(texture: .rotor1)
rotor1Node.position = CGPoint(x: 0, y: 20)
rotor1Node.zPosition = 10

/*:
 ### Create the rear Rotor node
  ![Rotor2](Rotor2.png)
 */
let rotor2Node = SKSpriteNode(texture: .rotor2)
rotor2Node.position = CGPoint(x: -5, y: -70)
rotor2Node.zPosition = 10

/*:
 ### Add the nodes to the root node
 The zPosition is what controls at what "layer" they are rendered.
 */
rootNode.addChild(rotor1Node)
rootNode.addChild(rotor2Node)
rootNode.addChild(missilesNode)
rootNode.addChild(bodyNode)
scene.addChild(rootNode)

//: [Next](@next)
