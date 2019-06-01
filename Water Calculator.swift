//
//  Water Calculator.swift
//  The Green App
//
//  Created by Harry on 31/5/19.
//  Copyright © 2019 LIN, Harry. All rights reserved.
//

import UIKit

class Water_Calculator: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //Outputs
    @IBOutlet weak var lblFeedback: UILabel!
    //Inputs
    @IBOutlet weak var txtHousehold: UITextField!
    @IBOutlet weak var txtQuarter: UITextField!
    //Actions
    @IBAction func btnCalculate(_ sender: Any) {
        //This if statement checks to see if either txtHousehold or txtQuarter is empty with the .isEmpty extension (Note: string values cannot equal nil). The trimmingCharacter option disregards any accidental white spaces. If either of these text fields are empty, an error message is displayed through the label lblFeedback. If neither is empty, the application continues (else).
        if String(txtHousehold.text!.trimmingCharacters(in: .whitespacesAndNewlines)).isEmpty || String(txtQuarter.text!.trimmingCharacters(in: .whitespacesAndNewlines)).isEmpty {
            lblFeedback.text = "Error. Please ensure all required fields are filled."
        } else {
            //Checks to see if txtHousehold is an integer. The trimmingCharacter option is used to remove any accidental white spaces. If txtHousehold is an integer, the value is placed into the immutable varaible "household". If txtHousehold isn't an integer, it sends an error message to the label lblFeedback (scroll to bottom).
            if let household = Int(txtHousehold.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
                //Checks to see if txtQuarter is a double. The trimmingCharacter option is used to remove any accidental white spaces. If txtQuarter is a double, the value is placed into the immutable varaible "quarter". If txtQuarter isn't a double, it sends an error message to the label lblFeedback (scroll to bottom).
                if let quarter = Double(txtQuarter.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
                    //The immutable variable "dailyWaterPerCapita" equals the daily water usage of the household per person, in litres. The quarterly usage is divided by the number of people in the household (which had to be forced to a double to be usable in this equation), then multiplied by 1000 to convert to litres from kilolitres, then divided by 91 to convert to daily usage (assuming 91 days in 3 months).
                    let dailyWaterPerCapita:Double = quarter / Double(household) * 1000 / 91
                    //The mutable variable "litreWaterPrice" represents the price of water per litre. It is made to equal $0.002915 at first, as this represents the state water bulk price per litre for the Brisbane region (according to Queensland Urban Utilities). Additional water charges are added in the if statement below.
                    var litreWaterPrice:Double = 0.002915
                    // This if statement takes into account the tiered water pricing of the Queensland Urban Utilities distributor-retailer price. If the household's quarterly water usage exceeds 74kL per quarter (according to Queensland Urban Utilities, 74kL quarterly is the tier threshold), then the higher tiered price is added on to "litreWaterPrice". If not, then the lower tier price is added on to the existing state water bulk price.
                    if quarter > 74 {
                        litreWaterPrice += 0.001453
                    } else {
                        litreWaterPrice += 0.000768
                    }
                    //The potentialSavings variable determines how much money a household could save every quarter if each member of the household used 10 litres less every day. It is equal to the number of people in the household multiplied by 10 litres, multiplied by the price of water per litre, then multiplied by 91 days.
                    let potentialSavings = Double(household) * 10 * litreWaterPrice * 91
                    //This if statement compares the daily water usage of the household per person, in litres, with the SE Queensland average of approximately 155L. If "dailyWaterPerCapita" meets one of the criteria (which it will, thanks to the plethora of error-mitigation code), then the corresponding text is displayed through lblFeedback. All text outcomes will include "potentialSavings" to show the user how much they could save; the only difference is the description.
                    if dailyWaterPerCapita < 150 {
                        lblFeedback.text = "Congratulations! Compared to the Queensland average, your household is conservative with water usage, with an average daily water usage of less than 150L per person. However, you could save more than $\(potentialSavings) every 3 months if each member of your household used 10 litres less every day!"
                    } else if dailyWaterPerCapita >= 150 && dailyWaterPerCapita <= 160 {
                       lblFeedback.text = "Your household's water usage is average amongst Queensland households, with an average daily water usage between 150L and 160L per person. Consider being more conservative with water usage where possible. You could save more than $\(potentialSavings) every 3 months if each member of your household used 10 litres less every day!"
                    } else {
                        lblFeedback.text = "Your household’s water usage is higher than average, with an average daily water usage of more than 160L per person. Good ways to conserve water usage include limiting the amount of time spent in the shower, checking all taps and sinks for leakage, and using more efficient showerheads and appliances that use water. You could save more than $\(potentialSavings) every 3 months if each member of your household used 10 litres less every day!"
                    }
                    //This else statement corresponds with the if statement checking to see if the value entered into txtQuarter is a double.
                } else {
                    lblFeedback.text = "Not a valid number: \(String(describing: txtQuarter.text!)). Please enter a number with no more than 5 decimal places."
                }
                //This else statement corresponds with the if statement checking to see if the value entered into txtHousehold is an integer.
            } else {
                lblFeedback.text = "Not a valid number: \(String(describing: txtHousehold.text!)). Please enter a whole number."
            }
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
