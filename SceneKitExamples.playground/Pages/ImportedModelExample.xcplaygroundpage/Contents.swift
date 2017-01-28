//: [Previous](@previous)

import SceneKit
import PlaygroundSupport

let view = SCNView(frame: NSRect(x: 0, y: 0, width: 1024, height: 768))
view.showsStatistics = true
view.allowsCameraControl = true


PlaygroundPage.current.liveView = view


let scene = SCNScene(named: "tardis.dae")
let ambient1 = SCNNode()
ambient1.light = SCNLight()
ambient1.light?.type = .ambient
ambient1.position = SCNVector3(x: 5, y: 5, z: 5)
scene?.rootNode.addChildNode(ambient1)

let spot1 = SCNNode()
spot1.light = SCNLight()
spot1.light?.type = .ambient
spot1.position = SCNVector3(x: -1, y: -1, z: -1)
scene?.rootNode.addChildNode(spot1)

let spot2 = SCNNode()
spot2.light = SCNLight()
spot2.light?.type = .ambient
spot2.position = SCNVector3(x: 5, y: 5, z: 9)
scene?.rootNode.addChildNode(spot2)

let tardis = scene?.rootNode.childNode(withName: "Tardis", recursively: false)

view.scene = scene

let rotate = SCNAction.rotateBy(x: 0, y: 0, z: CGFloat(5 / M_PI), duration: 3)

tardis?.runAction(rotate)


//: [Next](@next)
