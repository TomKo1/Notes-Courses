//
//  GameViewController.swift
//  SampleGame
//
//  Created by Tomasz Kot on 01.07.2018.
//  Copyright © 2018 Tomasz Kot. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as? SKView {
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                
                view.presentScene(scene)
            }
        }
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
