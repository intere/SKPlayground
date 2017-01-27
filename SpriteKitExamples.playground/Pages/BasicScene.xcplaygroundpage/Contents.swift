//: [Previous](@previous)

import SpriteKit
import PlaygroundSupport

// Create the SpriteKit View
let view = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))

// Add it to the TimeLine
PlaygroundPage.current.liveView = view


// Create the scene and add it to the view
let scene = SKScene(size: CGSize(width: 1024, height: 768))
scene.scaleMode = .aspectFit
view.presentScene(scene)


// Add something to it!
let redBox = SKSpriteNode(color: .red, size:CGSize(width: 300, height: 300))
redBox.position = CGPoint(x: 512, y: 384)
scene.addChild(redBox)

//: [Next](@next)
