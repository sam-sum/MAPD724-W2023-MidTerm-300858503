//
//  LandscapeOcean.swift
//  MAPD724-W2023-MidTerm-300858503
//
//  Created by Samuel Sum on 2023-02-27.
//  Version 1

import GameplayKit
import SpriteKit

class LandscapeOcean : GameObject
{
    // constructor / initializer
    init()
    {
        super.init(imageString: "l_ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start()
    {
        zPosition = Layer.ocean.rawValue
        horizontalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -2253)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.x = 2253
    }
    
    func Move()
    {
        position.x -= horizontalSpeed!
    }
}

