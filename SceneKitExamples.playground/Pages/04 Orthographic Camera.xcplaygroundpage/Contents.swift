//: [Previous](@previous)

/*:
 # 04 Orthographic Cameras
 We'll load the same scene as the prior exercise, but display with an orthographic camera this time.
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
 I did not create this scene, credit goes to **Druid_CZ** at http://www.blendswap.com/blends/view/75948
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
 ### Get a reference to the Camera Node
 Then change the camera to use Orthographic Projection.
 
 According to Wikipedia:
 `
 Orthographic projection (or orthogonal projection) is a means of representing a three-dimensional object in two dimensions. It is a form of parallel projection, where all the projection lines are orthogonal to the projection plane,[1] resulting in every plane of the scene appearing in affine transformation on the viewing surface. A lens providing an orthographic projection is known as an (object-space) telecentric lens.
 `
 */
let camera = scene?.rootNode.childNode(withName: "Camera", recursively: false)
camera?.camera?.usesOrthographicProjection = true
camera?.camera?.orthographicScale = 3.5

/*:
 A very successful (and well known) game that utilizes this effect is **Crossy Road**
 ![Crossy Road](Crossy-Road.jpg)
 */

/*:
 ---
 ### Now animate the camera
 */
camera?.runAction(SCNAction.sequence([
    SCNAction.rotateBy(x: CGFloat(-5 * M_PI / 180), y: CGFloat(5 * M_PI / 180), z: 0, duration: 3),
    SCNAction.move(by: SCNVector3(x: -5, y: 0, z: 0), duration: 3),
]))


//: [Next](@next)
