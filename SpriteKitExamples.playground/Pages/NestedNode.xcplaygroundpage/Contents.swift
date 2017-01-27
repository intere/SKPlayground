//: [Previous](@previous)

import SpriteKit
import PlaygroundSupport

extension SKTexture {
    static let body = SKTexture(imageNamed: "Body")
    static let missiles = SKTexture(imageNamed: "Missiles")
    static let rotor1 = SKTexture(imageNamed: "Rotor1")
    static let rotor2 = SKTexture(imageNamed: "Rotor2")
}

let view = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
PlaygroundPage.current.liveView = view
let scene = SKScene(size: CGSize(width: 1024, height: 768))
scene.scaleMode = .aspectFit
view.presentScene(scene)

let rootNode = SKSpriteNode(color: .white, size: CGSize(width: 200, height: 200))
rootNode.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)

let missilesNode = SKSpriteNode(texture: .missiles)
missilesNode.position = CGPoint(x: 0, y: 30)
missilesNode.zPosition = 0

let bodyNode = SKSpriteNode(texture: .body)
bodyNode.zPosition = 5

let rotor1Node = SKSpriteNode(texture: .rotor1)
rotor1Node.position = CGPoint(x: 0, y: 20)
rotor1Node.zPosition = 10

let rotor2Node = SKSpriteNode(texture: .rotor2)
rotor2Node.position = CGPoint(x: -5, y: -70)
rotor2Node.zPosition = 10

rootNode.addChild(missilesNode)
rootNode.addChild(bodyNode)
rootNode.addChild(rotor1Node)
rootNode.addChild(rotor2Node)
scene.addChild(rootNode)

//rotor1Node.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(90.0/M_PI), duration: 1)))

//: [Next](@next)
