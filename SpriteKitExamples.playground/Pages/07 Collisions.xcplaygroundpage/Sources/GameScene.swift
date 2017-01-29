
import SpriteKit
import GameplayKit


public class GameScene: SKScene {
    fileprivate static let wallSize: CGFloat = 10

    public var balls = [Ball]()
    public let goomba = Goomba()

    fileprivate var lastUpdateTime: TimeInterval = 0

    override public init(size: CGSize) {
        super.init(size: size)
        setupScene()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime == 0 {
            lastUpdateTime = currentTime
        }
        let deltaTime = currentTime - lastUpdateTime

        goomba.agent.update(deltaTime: deltaTime)
        for ball in balls {
            ball.agent.update(deltaTime: deltaTime)
        }

        lastUpdateTime = currentTime
    }

}

// MARK: - Helpers

fileprivate extension GameScene {

    func setupScene() {
        buildWalls()
        let obstacles = SKNode.obstacles(fromNodePhysicsBodies: children)
        let graph = GKObstacleGraph(obstacles: obstacles, bufferRadius: 0)
        let endNode = GKGraphNode2D(point: float2(x: 2048.0, y: 2048.0))
        graph.connectUsingObstacles(node: endNode)

        goomba.position = CGPoint.random(range: gameBounds)

        for _ in 0..<2 {
            let ball = Ball()
            ball.position = CGPoint.random(range: gameBounds)
            balls.append(ball)
            ball.configure(goomba: goomba, obstacles: obstacles)
            addChild(ball)
        }

        goomba.configure(balls: balls, obstacles: obstacles)

        addChild(goomba)
    }

    var gameBounds: CGRect {
        let size = GameScene.wallSize
        return CGRect(origin: CGPoint(x: size/2, y: size/2), size: CGSize(width: frame.size.width - size, height: frame.size.height - size))
    }

    func buildWalls() {
        let size = GameScene.wallSize
        createAndAddWall(x: frame.midX, y: frame.minY + size/2, width: frame.width, height: size)
        createAndAddWall(x: frame.midX, y: frame.maxY - size/2, width: frame.width, height: size)
        createAndAddWall(x: frame.minX + size/2, y: frame.midY, width: size, height: frame.height)
        createAndAddWall(x: frame.maxX - size/2, y: frame.midY, width: size, height: frame.height)
    }

    func createAndAddWall(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let wall = SKSpriteNode(color: .green, size: CGSize(width: width, height: height))
        wall.position = CGPoint(x: x, y: y)
        wall.physicsBody = SKPhysicsBody(rectangleOf: wall.size)
        wall.physicsBody?.affectedByGravity = false
        wall.physicsBody?.isDynamic = false
        wall.physicsBody?.collisionBitMask = .wall
        wall.physicsBody?.contactTestBitMask = .ball | .goomba
        addChild(wall)
    }

}

fileprivate extension CGFloat {

    static func random(from: CGFloat, to: CGFloat) -> CGFloat {
        let random = arc4random() % UInt32(to - from)
        return CGFloat(random) + from
    }

}

fileprivate extension CGPoint {
    static func random(range: CGRect) -> CGPoint {
        let x = CGFloat.random(from: range.minX, to: range.maxX)
        let y = CGFloat.random(from: range.minY, to: range.maxY)
        return CGPoint(x: x, y: y)
    }

    var asFloat2: float2 {
        return float2(x: Float(x), y: Float(y))
    }
}
