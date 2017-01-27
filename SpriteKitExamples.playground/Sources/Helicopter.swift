import SpriteKit

public class Helicopter: SKSpriteNode {

    let missilesNode: SKSpriteNode
    let bodyNode: SKSpriteNode
    public let rotor1Node: SKSpriteNode
    let rotor2Node: SKSpriteNode

    public init() {
        missilesNode = SKSpriteNode(texture: .missiles)
        missilesNode.position = CGPoint(x: 0, y: 30)
        missilesNode.zPosition = 0

        bodyNode = SKSpriteNode(texture: .body)
        bodyNode.zPosition = 5

        rotor1Node = SKSpriteNode(texture: .rotor1)
        rotor1Node.position = CGPoint(x: 0, y: 20)
        rotor1Node.zPosition = 10

        rotor2Node = SKSpriteNode(texture: .rotor2)
        rotor2Node.position = CGPoint(x: -5, y: -70)
        rotor2Node.zPosition = 10

        super.init(texture: nil, color: .clear, size: CGSize(width: 200, height: 200))

        addChild(missilesNode)
        addChild(bodyNode)
        addChild(rotor1Node)
        addChild(rotor2Node)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SKTexture {
    static let body = SKTexture(imageNamed: "Body")
    static let missiles = SKTexture(imageNamed: "Missiles")
    static let rotor1 = SKTexture(imageNamed: "Rotor1")
    static let rotor2 = SKTexture(imageNamed: "Rotor2")
}

