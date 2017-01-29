/*:
 # 01 SceneKit examples
 This example will create a random geometrical shape.
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
view.autoenablesDefaultLighting = true
PlaygroundPage.current.liveView = view

/*:
 ---
 ### Create the Scene
 */
let scene = SCNScene()
view.scene = scene

/*:
 ---
 ### Add a random shape of random color
 */
let shape = ShapeType.random
let node = SCNNode(geometry: shape.geometry)
node.geometry?.materials.first?.diffuse.contents = NSColor.random

scene.rootNode.addChildNode(node)

//: [Next](@next)