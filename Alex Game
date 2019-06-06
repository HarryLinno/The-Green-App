//
//  ViewController.swift
//  ALEX
//
//  Created by Harry on 6/6/19.
//  Copyright © 2019 LIN, Harry. All rights reserved.
//
//Image - Red bin, green bin, yellow bin
//BRICK, GRASS, CAN

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        imgTrashImage.image = UIImage(named: "\(items.randomElement()!)")
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var imgTrashImage: UIImageView!
    var score:Int = 0
    var items:[String] = ["Brick","Can","Grass"]
    @IBOutlet weak var lblScore: UILabel!
    @IBAction func btnRed(_ sender: Any) {
        switch imgTrashImage.image {
        case UIImage(named: "Brick"):
            score += 10
            lblScore.text = String(score)
            imgTrashImage.image = UIImage(named: "\(items.randomElement()!)")
        case UIImage(named: "Grass"):
            score -= 1
            lblScore.text = String(score)
            imgTrashImage.image = UIImage(named: "\(items.randomElement()!)")
        default:
            score -= 5
            lblScore.text = String(score)
            imgTrashImage.image = UIImage(named: "\(items.randomElement()!)")
        }
    }
    @IBAction func btnGreen(_ sender: Any) {
        switch imgTrashImage.image {
        case UIImage(named: "Brick"):
            score -= 1
            lblScore.text = String(score)
            imgTrashImage.image = UIImage(named: "\(items.randomElement()!)")
        case UIImage(named: "Grass"):
            score += 10
            lblScore.text = String(score)
            imgTrashImage.image = UIImage(named: "\(items.randomElement()!)")
        default:
            score -= 5
            lblScore.text = String(score)
            imgTrashImage.image = UIImage(named: "\(items.randomElement()!)")
        }
    }
    @IBAction func btnYellow(_ sender: Any) {
        switch imgTrashImage.image {
        case UIImage(named: "Brick"):
            score -= 1
            lblScore.text = String(score)
            imgTrashImage.image = UIImage(named: "\(items.randomElement()!)")
        case UIImage(named: "Grass"):
            score -= 5
            lblScore.text = String(score)
            imgTrashImage.image = UIImage(named: "\(items.randomElement()!)")
        default:
            score += 10
            lblScore.text = String(score)
            imgTrashImage.image = UIImage(named: "\(items.randomElement()!)")
        }
    }
    
    
}

