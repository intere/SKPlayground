
import SceneKit


public enum ShapeType: Int {
    case box = 0
    case sphere
    case pyramid
    case torus
    case capsule
    case cylinder
    case cone
    case tube

    public static var values: [ShapeType] {
        return [ .box, .sphere, .pyramid, .torus, .capsule, .cylinder, .cone, .tube ]
    }

    public static var random: ShapeType {
        let maxValue = tube.rawValue
        let rand = arc4random_uniform(UInt32(maxValue+1))
        return ShapeType(rawValue: Int(rand))!
    }

    /// Generates the SceneKit Geometry for the provided Shape Type
    ///
    /// - Returns: The SCNGeometry that correlates to the provided ShapeType
    public var geometry: SCNGeometry {
        var geometry: SCNGeometry

        switch self {
        case .capsule:
            geometry = SCNCapsule(capRadius: 0.5, height: 2)
        case .cone:
            geometry = SCNCone(topRadius: 0, bottomRadius: 1, height: 1)
        case .cylinder:
            geometry = SCNCylinder(radius: 0.25, height: 1)
        case .pyramid:
            geometry = SCNPyramid(width: 1, height: 1, length: 1)
        case .sphere:
            geometry = SCNSphere(radius: 1)
        case .torus:
            geometry = SCNTorus(ringRadius: 1, pipeRadius: 0.25)
        case .tube:
            geometry = SCNTube(innerRadius: 0.25, outerRadius: 0.5, height: 1)
        case .box:
            geometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        }
        
        return geometry
    }
}


