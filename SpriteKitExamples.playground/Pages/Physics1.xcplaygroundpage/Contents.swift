//: [Previous](@previous)

import SpriteKit
import PlaygroundSupport

extension SKTexture {
    static let ball = SKTexture(imageNamed: "ball")
}

PlaygroundPage.current.needsIndefiniteExecution = true
let view = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
PlaygroundPage.current.liveView = view
let scene = SKScene(size: CGSize(width: 1024, height: 768))
scene.scaleMode = .aspectFit
scene.backgroundColor = .black
view.presentScene(scene)

func dropTheBall() {
    let ballNode = SKSpriteNode(texture: .ball)
    ballNode.name = "ball"
    ballNode.color = .random
    ballNode.colorBlendFactor = 0.7
    let randomX = Int.random(max: Int(scene.frame.maxX))

    ballNode.position = CGPoint(x: CGFloat(randomX), y: scene.frame.maxY-30)
    ballNode.setScale(0.25)

    ballNode.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(ballNode.size.width))

    scene.addChild(ballNode)

//    print("Spawed a ball at \(ballNode.position)")
}

let spawnBallAction = SKAction.customAction(withDuration: 3) { _  in
    dropTheBall()
}

let sequence = SKAction.sequence([spawnBallAction, SKAction.wait(forDuration: 3)])
scene.run(SKAction.repeatForever(sequence))

//: [Next](@next)
