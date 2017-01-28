//: [Previous](@previous)

/*:
 # 05 Building Custom Actions
 In this example, we will use an extension to encapsulate actions into functions we can call on our custom sprite class:
 * rotating the main rotor
 * flying along a path

 */

import SpriteKit
import PlaygroundSupport

/*:
 ----
 ### The extension to the Helicopter class
 */
public extension Helicopter {

    /// Flies along the provided CGPath at a specific speed
    func flyAlongPath(path: CGPath) {
        startRotors()
        let action = SKAction.follow(path, asOffset: false, orientToPath: true, speed: 60)
        run(action)
    }

    /// Spins the main rotor and plays the helicopter sound
    func startRotors() {
        let rotateAction = SKAction.rotate(byAngle: CGFloat(1080/M_PI), duration: 1.5)
        rotor1Node.run(SKAction.repeatForever(rotateAction))

        let rotorSound = SKAction.playSoundFileNamed("helicopter.mp3", waitForCompletion: true)
        rotor1Node.run(rotorSound) {
            self.rotor1Node.removeAllActions()
        }
    }
}

/*:
 ---
 ### Create The view and scene
 Then set the PlaygroundPage's liveView to be the SKView.
 */

let view = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
let scene = SKScene(size: CGSize(width: 1024, height: 768))
scene.scaleMode = .aspectFit
view.presentScene(scene)
PlaygroundPage.current.liveView = view

/*:
 ---
 ### Create The Helicopter and add it to the scene
 */
let helicopter = Helicopter()
helicopter.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
scene.addChild(helicopter)
helicopter.setScale(3)

/*:
 ---
 ### Create The path to fly the helicopter along
 */
let pathRect = CGRect(origin: CGPoint(x: scene.frame.midX, y: scene.frame.midY), size: CGSize(width: 100, height: 150))
let path = CGPath(roundedRect: pathRect, cornerWidth: 10, cornerHeight: 10, transform: nil)

/*:
 ---
 ### Now fly the helicopter
 by calling the function we created.
 */
helicopter.flyAlongPath(path: path)


//: [Next](@next)
