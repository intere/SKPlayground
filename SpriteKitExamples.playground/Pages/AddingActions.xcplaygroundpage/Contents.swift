//: [Previous](@previous)

import SpriteKit
import PlaygroundSupport

let view = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
PlaygroundPage.current.liveView = view
let scene = SKScene(size: CGSize(width: 1024, height: 768))
scene.scaleMode = .aspectFit
view.presentScene(scene)

let helicopter = Helicopter()
helicopter.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
scene.addChild(helicopter)

let rotateAction = SKAction.rotate(byAngle: CGFloat(1080/M_PI), duration: 1.5)
helicopter.rotor1Node.run(rotateAction)
//helicopter.rotor1Node.run(SKAction.repeatForever(rotateAction))

//let pathRect = CGRect(origin: CGPoint(x: scene.frame.midX, y: scene.frame.midY), size: CGSize(width: 100, height: 150))
//let path = CGPath(roundedRect: pathRect, cornerWidth: 10, cornerHeight: 10, transform: nil)
//helicopter.run(SKAction.follow(path, asOffset: false, orientToPath: true, speed: 40))

//: [Next](@next)
