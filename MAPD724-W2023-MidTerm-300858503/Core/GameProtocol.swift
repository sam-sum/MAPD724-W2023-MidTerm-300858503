//
//  GameProtocol.swift
//  MAPD724-W2023-MidTerm-300858503
//
//  Created by Samuel Sum on 2023-02-27.
//

protocol GameProtocol
{
    // Initialization
    func Start()
    
    // update every frame
    func Update()
    
    // check if the position is outside the bounds of the Screen
    func CheckBounds()
    
    // a method to reset the position
    func Reset()
}
