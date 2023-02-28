//
//  LandscapeIsland.swift
//  MAPD724-W2023-MidTerm-300858503
//
//  Created by Samuel Sum on 2023-02-27.
//  Version 1

import GameplayKit
import SpriteKit

class LandscapeIsland : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "l_island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.island.rawValue
        horizontalSpeed = 5.0
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -876)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.x = 876
        // get a pseudo random number
        let randomY:Int = (randomSource?.nextInt(upperBound: 626))! - 313
        position.y = CGFloat(randomY)
        isColliding = false
    }
    
    // public method
    func Move()
    {
        position.x -= horizontalSpeed!
    }
}

