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
 ### Add the shapes of random colors
 */
var index: CGFloat = 0
for type in ShapeType.values {
    let node = SCNNode(geometry: type.geometry)
    node.position = SCNVector3(index * 1, 0, 0)
    node.geometry?.materials.first?.diffuse.contents = NSColor.random
    index += 2
    scene.rootNode.addChildNode(node)
}

//: [Next](@next)
