//
//  GameMenu.swift
//  The Green App
//
//  Created by Harry on 5/6/19.
//  Copyright © 2019 LIN, Harry. All rights reserved.
//

import UIKit

class GameMenu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //The buttons for the yellow bin, red bin, green bin, and reset button are disabled when the view loads up ("viewDidLoad()"). This is to remove the need for error messages should the user press these buttons before they press "btnStart".
        btnYellow.isEnabled = false
        btnRed.isEnabled = false
        btnGreen.isEnabled = false
        btnReset.isEnabled = false
        // Do any additional setup after loading the view.
    }
    //Outlets
    //Some of the buttons have been declared as outlets as well as actions in order to allow their physical properties (such as text, images etc.) to be changed as well as controlling whether the button is enabled or disabled (clickable or not).
    @IBOutlet weak var btnYellow: UIButton!
    @IBOutlet weak var btnRed: UIButton!
    @IBOutlet weak var btnGreen: UIButton!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var lblFeedback: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    //"score" is a mutable integer variable that is intially declared as 0. It represents the user's score, and is updated when the user makes a correct or incorrect choice in the game.
    var score:Int = 0
    //"items" is a string array that contains the names of the images that will be in the game. For the purpose of this assignment, the current amount of image names in the array and in the game will be limited to 4.
    var items:[String] = ["Cheeseburger","BeerCan","DeadFlower","PizzaBox"]
    //"nextRound()" is a function that, when called upon, will update the text in "lblScore" with the the value of variable "score" and also set the image property of "imgItem" to a random image, selected from the array "items".
    func nextRound() {
        lblScore.text = String(score)
        imgItem.image = UIImage(named: "\(items.randomElement()!)")
    }
    //"btnReset" is an action that, when activated, will set the value of "score" to 0 in order to reset the user's score, and activates the "nextRound()" function to effectively reset the entire text. Text will then appear in "lblFeedback", telling the user that the game has been reset.
    @IBAction func btnReset(_ sender: UIButton) {
        score = 0
        nextRound()
        lblFeedback.text = "The game has been reset. Have fun!"
    }
    //"btnStart" is an action that, when activated, will start the game. "btnStart" is the only button that is enabled when the user loads into the view, and will also activate "btnYellow", "btnRed", "btnGreen", "btnReset" when it is activated. It will deactivate itself after being pressed as it will no longer be useful, and also to avoid the need for error messages. "btnStart" will set "score" to 0 (even if "score" was already 0, just to be sure), and will call the function "nextRound()" while also updating the text in "lblFeedback" with a prompt and instructions for the game.
    @IBAction func btnStart(_ sender: UIButton) {
        btnYellow.isEnabled = true
        btnRed.isEnabled = true
        btnGreen.isEnabled = true
        btnStart.isEnabled = false
        btnReset.isEnabled = true
        score = 0
        nextRound()
        lblFeedback.text = "In which bin would you put the displayed item? Tap a bin to select it."
    }
    //"btnYellow" is initally disabled when the user loads into the view for the first time, but is reactivated after "btnStart" is activated. When "btnYellow" is selected, it will check the image currently set in "imgItem" through a switch statement, checking to see if the image matches any of the images listed in the cases. If the user was correct in selecting the yellow bin (eg. picking the yellow bin for "BeerCan"), the text in "lblFeedback" is updated with text telling the user they are correct, while 10 is added to the value of "score". The function "nextRound()" is then activated. If the user makes a minorly incorrect choice (eg. picking the yellow bin for "Cheeseburger"), the text in "lblFeedback" is updated, telling the user they have made an error and gives them either the correct answer or a description of why they're wrong. The value of "score" is subtracted by 1, and then the function "nextRound()" is called. If the user makes a very incorrect answer (eg. picking the yellow bin for "DeadFlowers"), the text of "lblFeedback" is updated with a description of their mistake, the value of "score" is subtracted by 5 and "nextRound()" is called. Since it is impossible for the user to be given an image that isn't part of the switch statement, the need for an error message is diminished. This description also applies to "btnRed" and "btnGreen".
    @IBAction func btnYellow(_ sender: Any) {
        switch imgItem.image {
        case UIImage(named: "DeadFlower"):
            lblFeedback.text = "Incorrect. You certainly cannot recycle this item as it is classified as 'green waste' and made from organic matter. You lose 5 points."
            score -= 5
            nextRound()
        case UIImage(named: "BeerCan"):
            lblFeedback.text = "Correct! This item certainly CAN be placed in a yellow bin as it is recyclable. You gain 10 points!"
            score += 10
            nextRound()
        default:
            lblFeedback.text = "Incorrect. While this isn't the most incorrect answer, the better option would be the red bin for general waste. You lose 1 point."
            score -= 1
            nextRound()
        }
    }
    //Refer to the description for "btnYellow".
    @IBAction func btnRed(_ sender: Any) {
        switch imgItem.image {
        case UIImage(named: "DeadFlower"):
            lblFeedback.text = "Incorrect. While this isn't the most incorrect answer, this item cannot be recycled as it is comprised of organic matter and belongs in the green bin. You lose 1 point."
            score -= 1
            nextRound()
        case UIImage(named: "BeerCan"):
            lblFeedback.text = "Incorrect. This item can be recycled and therefore belongs in the yellow bin - the more you know. You lose 5 points."
        default:
            lblFeedback.text = "Correct! This item belongs in the red bin along with other general waste. You gain 10 points!"
            score += 10
            nextRound()
        }
    }
    //Refer to the description for "btnYellow".
    @IBAction func btnGreen(_ sender: Any) {
        switch imgItem.image {
        case UIImage(named: "DeadFlower"):
            lblFeedback.text = "Correct! This item is an example of organic waste and can be placed in the green bin. You gain 10 points!"
            score += 10
            nextRound()
        case UIImage(named: "BeerCan"):
            lblFeedback.text = "Incorrect. This item is recyclable and while green usually stands for eco-friendly, the green bin stands for compost, which this item is not. At least you didn't pick the red bin. You lose 1 point."
            score -= 1
            nextRound()
        default:
            lblFeedback.text = "Incorrect. This item belongs in the red bin along with other general waste and definitely does not belong in the green bin. You lose 5 points."
            score -= 5
            nextRound()
    }
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
