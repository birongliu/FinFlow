//
//  SettingsViewController.swift
//  FinFlow
//
//  Created by Bi Rong Liu on 4/22/24.
//

import UIKit
import Nuke

class SettingsViewController: UIViewController {
    @IBOutlet var totalBalanceField: UITextField!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var username: UILabel!
    public static var submissionKey = "submissionKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalBalanceField.keyboardType = .decimalPad;
        let user = NetworkAuthManager.getProfile();
        username.text = user?.username;
        Nuke.loadImage(with: user!.avatarURL, into: profileImage);
    }
    
    @IBAction func submissionButton(_ sender: Any) {
        UserDefaults.standard.set(totalBalanceField.text, forKey: SettingsViewController.submissionKey)
        presentAlert(title: "Success", message: "Updated the balance")
    }
    
    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        UserDefaults.standard.removeObject(forKey: NetworkAuthManager.userKey)
        dismiss(animated: true);
    }
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
}
