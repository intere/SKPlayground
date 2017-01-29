
import SpriteKit
import GameplayKit

/// The Goomba Sprite
public class Goomba: SKSpriteNode {

    /// The AI Agent
    public let agent = GKAgent2D()

    public init() {
        super.init(texture: .goomba1, color: .lightGray, size: SKTexture.goomba1.size())
        colorBlendFactor = 0.9
        entity?.addComponent(agent)
        agent.delegate = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}

// MARK: - Goomba API

public extension Goomba {

    func respawn() {
        alpha = 1.0
        startMoving()
    }

    typealias CompletionBlock = () -> Void

    func die() {
        agent.delegate = nil
        physicsBody = nil
        removeAllActions()

        run(SKAction.sequence([
            SKAction.scale(to: 3.5, duration: 1),
            SKAction.scale(to: 1, duration: 1),
            SKAction.fadeAlpha(to: 0, duration: 1),
            SKAction.removeFromParent(),
            SKAction.wait(forDuration: 1)
            ]))
    }

    func startMoving() {
        run(SKAction.repeatForever(SKAction.animate(with: [.goomba1, .goomba2], timePerFrame: 0.2)))
    }

    func configure(balls: [Ball], obstacles: [GKObstacle]) {
        startMoving()

        var goals = [GKGoal]()
        var weights = [NSNumber]()

        goals.append(GKGoal(toAvoid: obstacles, maxPredictionTime: 10))
        weights.append(10)

        for ball in balls {
            goals.append(GKGoal(toFleeAgent: ball.agent))
            weights.append(500)
        }
        goals.append(GKGoal(toWander: 400))
        weights.append(499)

        agent.behavior = GKBehavior(goals: goals, andWeights: weights)
        agent.maxAcceleration = 250
        agent.maxSpeed = 400
        agent.position = vector2(Float(position.x), Float(position.y))
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.affectedByGravity = false
        physicsBody?.allowsRotation = false
        physicsBody?.collisionBitMask = .goomba
        physicsBody?.contactTestBitMask = .wall | .ball
    }
}

// MARK: - GKAgentDelegate

extension Goomba: GKAgentDelegate {

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

// MARK: - Textures
extension SKTexture {
    static fileprivate let goomba1 = SKTexture(image: #imageLiteral(resourceName: "goomba1.png"))
    static fileprivate let goomba2 = SKTexture(image: #imageLiteral(resourceName: "goomba2.png"))
}
