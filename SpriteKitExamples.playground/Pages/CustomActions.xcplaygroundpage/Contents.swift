//: [Previous](@previous)

import SpriteKit
import PlaygroundSupport

public extension Helicopter {

    func flyAlongPath(path: CGPath) {
        startRotors()
        let action = SKAction.follow(path, asOffset: false, orientToPath: true, speed: 60)
        run(action)
    }

    func startRotors() {
        let rotateAction = SKAction.rotate(byAngle: CGFloat(1080/M_PI), duration: 1.5)
        rotor1Node.run(SKAction.repeatForever(rotateAction))

        let rotorSound = SKAction.playSoundFileNamed("helicopter.mp3", waitForCompletion: true)
        rotor1Node.run(rotorSound) {
            self.rotor1Node.removeAllActions()
        }
    }
}


let view = SKView(frame: CGRect(x: 0, y: 0, width: 1024, height: 768))
PlaygroundPage.current.liveView = view
let scene = SKScene(size: CGSize(width: 1024, height: 768))
scene.scaleMode = .aspectFit
view.presentScene(scene)

let helicopter = Helicopter()
helicopter.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
scene.addChild(helicopter)

let pathRect = CGRect(origin: CGPoint(x: scene.frame.midX, y: scene.frame.midY), size: CGSize(width: 100, height: 150))
let path = CGPath(roundedRect: pathRect, cornerWidth: 10, cornerHeight: 10, transform: nil)
helicopter.flyAlongPath(path: path)


//: [Next](@next)
