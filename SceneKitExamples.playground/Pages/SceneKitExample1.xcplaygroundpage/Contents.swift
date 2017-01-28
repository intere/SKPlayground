//: Playground - noun: a place where people can play

import SceneKit
import PlaygroundSupport

let view = SCNView(frame: NSRect(x: 0, y: 0, width: 1024, height: 768))
view.showsStatistics = true
view.allowsCameraControl = true
view.autoenablesDefaultLighting = true

PlaygroundPage.current.liveView = view


let scene = SCNScene()

let shape = ShapeType.random
let node = SCNNode(geometry: shape.geometry)
node.geometry?.materials.first?.diffuse.contents = NSColor.random

scene.rootNode.addChildNode(node)

view.scene = scene

