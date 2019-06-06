//
//  ViewController.swift
//  ALEX
//
//  Created by Harry on 6/6/19.
//  Copyright © 2019 LIN, Harry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Once the view loads, a random image is selected from the array "items" and placed into the image property of "imgTrashImage".
        imgTrashImage.image = UIImage(named: "\(items.randomElement()!)")
        // Do any additional setup after loading the view.
    }
    //Outlets
    @IBOutlet weak var imgTrashImage: UIImageView!
    @IBOutlet weak var lblScore: UILabel!
    //The mutable integer variable "score" keeps track of the user's track record; the higher the score, the higher percentage of correct answers.
    var score:Int = 0
    //"items" is an array that contains the names of all the images that will be available in the game. For the purpose of this assignment, the number of images has been limited to 3.
    var items:[String] = ["Brick","Can","Grass"]
    //Actions
    @IBAction func btnRed(_ sender: Any) {
        //The current trash item is put into a switch statement. Each case checks to see if the current image is a certain image. If the user's choice of bin is inappropriate for the item currently displayed, their score is deducted by either 1 or 5, depending on how incorrect they are. If their decision is appropriate, the "score" variable is increased by 10. After the text in "lblScore" has been updated with the user's new score, the image is once again randomised. This process also applies to "btnGreen" and "btnYellow".
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
        //Refer to the description for "btnRed"
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
        //Refer to the description for "btnRed"
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

