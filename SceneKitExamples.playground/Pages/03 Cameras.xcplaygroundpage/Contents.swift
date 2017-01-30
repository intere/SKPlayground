//: [Previous](@previous)

/*:
 # 03 Cameras
 This example will demonstrate the different camera types
 */

import SceneKit
import PlaygroundSupport

/*:
 ---
 ### Create the SceneKit View
 */
let view = SCNView(frame: NSRect(x: 0, y: 0, width: 1024, height: 768))
view.showsStatistics = true
view.allowsCameraControl = true
PlaygroundPage.current.liveView = view

/*:
 ---
 ### Import the model (Scene)
 I did not create this, credit goes to **Druid_CZ** at http://www.blendswap.com/blends/view/75948
 */
let scene = SCNScene(named: "mountain.dae")
view.scene = scene
//scene?.rootNode.geometry?.firstMaterial?.diffuse.contents = NSColor.black
scene?.background.contents = NSColor.blue

/*:
 ---
 ### Create and add 3 lights
 */
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

/*:
 ---
 ### Get a reference to the Tardis Node
 */
let camera = scene?.rootNode.childNode(withName: "Camera", recursively: false)

/*:
 ---
 ### Create a rotate action and run it on the Tardis
 */
camera?.runAction(SCNAction.sequence([
    SCNAction.move(by: SCNVector3(x: -5, y: 0, z: 0), duration: 3),
    SCNAction.move(by: SCNVector3(x: 0, y: 0, z: 5), duration: 3),
//    SCNAction.rotate()
]))


//: [Next](@next)
