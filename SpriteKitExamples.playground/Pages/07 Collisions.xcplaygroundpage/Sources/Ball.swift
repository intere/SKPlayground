
import SpriteKit
import GameplayKit


/// The Ball Sprite
public class Ball: SKSpriteNode {
    /// The AI Agent
    public let agent = GKAgent2D()

    public init() {
        super.init(texture: .ball, color: .blue, size: SKTexture.ball.size())
        setScale(0.15)
        colorBlendFactor = 0.9
        entity?.addComponent(agent)
        agent.delegate = self
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Ball API

public extension Ball {

    func configure(goomba: Goomba, obstacles: [GKObstacle]) {

        removeAllActions()
        run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(M_PI), duration: 1)))

        var goals = [GKGoal]()
        var weights = [NSNumber]()

        goals.append(GKGoal(toAvoid: obstacles, maxPredictionTime: 10))
        weights.append(50)

        goals.append(GKGoal(toInterceptAgent: goomba.agent, maxPredictionTime: 15))
        weights.append(10)

        agent.behavior = GKBehavior(goals: goals, andWeights: weights)
        agent.maxAcceleration = 150
        agent.maxSpeed = 500
        agent.position = vector2(Float(position.x), Float(position.y))

        physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
        physicsBody?.affectedByGravity = false
        physicsBody?.allowsRotation = false
        physicsBody?.collisionBitMask = .ball
        physicsBody?.contactTestBitMask = .wall | .goomba

    }

}

// MARK: - GKAgentDelegate

extension Ball: GKAgentDelegate {

    public func agentWillUpdate(_ agent: GKAgent) {
        guard let agent = agent as? GKAgent2D else {
            return
        }
        agent.position = float2(x: Float(position.x), y: Float(position.y))
    }

    public func agentDidUpdate(_ agent: GKAgent) {
        guard let agent = agent as? GKAgent2D else {
            return
        }
        position = CGPoint(x: CGFloat(agent.position.x), y: CGFloat(agent.position.y))
    }

}


// MARK: - Texture
extension SKTexture {
    static fileprivate let ball = SKTexture(image: #imageLiteral(resourceName: "ball.png"))
}
