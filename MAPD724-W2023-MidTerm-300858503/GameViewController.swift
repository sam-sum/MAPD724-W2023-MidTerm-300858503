//
//  GameViewController.swift
//  MAPD724-W2023-MidTerm-300858503
//
//  Created by Samuel Sum on 2023-02-27.
//  Version 1

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    // Instance Variables
    var currentScene: GKScene?
    
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var EndLabel: UILabel!
    @IBOutlet weak var RestartButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        presentStartScene()
        
        CollisionManager.gameViewController = self
        
        //ask the system to start notifying when interface change
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        //add the observer
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(orientationChanged(notification:)),
            name: UIDevice.orientationDidChangeNotification,
            object: nil)
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func setScene(sceneName: String) -> Void
    {
        currentScene = GKScene(fileNamed: sceneName)
        if let scene = currentScene!.rootNode as! SKScene?
        {
            scene.scaleMode = .aspectFill
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    func presentStartScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        StartLabel.isHidden = false
        StartButton.isHidden = false
        setScene(sceneName: "StartScene")
    }
    
    func presentEndScene()
    {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        RestartButton.isHidden = false
        EndLabel.isHidden = false
        setScene(sceneName: "EndScene")
    }
    
    @IBAction func StartButton_Pressed(_ sender: UIButton)
    {
        //force landscape mode
        DispatchQueue.main.async {
                    //OrientationManager.landscapeSupported = !OrientationManager.landscapeSupported
                    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                    windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations:  .landscape ))
                    self.setNeedsUpdateOfSupportedInterfaceOrientations()
                }
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        StartLabel.isHidden = true
        StartButton.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
    }
    
    @IBAction func RestartButton_Pressed(_ sender: UIButton)
    {
        //force landscape mode
        DispatchQueue.main.async {
                    //OrientationManager.landscapeSupported = !OrientationManager.landscapeSupported
                    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                    windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations:  .landscape ))
                    self.setNeedsUpdateOfSupportedInterfaceOrientations()
                }
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        RestartButton.isHidden = true
        EndLabel.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        setScene(sceneName: "GameScene")
        
    }
    
    @objc func orientationChanged(notification : NSNotification) {
        if (ScoreManager.isPlaying) {
            //force landscape mode
            DispatchQueue.main.async {
                //OrientationManager.landscapeSupported = !OrientationManager.landscapeSupported
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations:  .landscape ))
                self.setNeedsUpdateOfSupportedInterfaceOrientations()
            }
        }
    }
}
