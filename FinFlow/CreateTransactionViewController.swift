//
//  CreateReceiptViewController.swift
//  FinFlow
//
//  Created by Bi Rong Liu on 4/20/24.
//

import UIKit

class CreateReceiptViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var amountSpendText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowed = CharacterSet.decimalDigits;
        return allowed.isSubset(of: CharacterSet(charactersIn: string))
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
