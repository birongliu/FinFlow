//
//  OverviewViewController.swift
//  FinFlow
//
//  Created by Bi Rong Liu on 4/22/24.
//

import UIKit

class OverviewViewController: UIViewController {
    @IBOutlet var data: UILabel!
    
    @IBOutlet var emptyLabel: UILabel!
 
    @IBOutlet var transactionInfo: UITextView!
    var transactions = [Transaction]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshTransaction();
        // Do any additional setup after loading the view
    
        
    }
    @IBOutlet var transactionLabel: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshTransaction();
    }
    
    private func refreshTransaction() {
        let transactions = Transaction.getTransaction();
        self.transactions = transactions
        data.isHidden = transactions.isEmpty;
        transactionLabel.isHidden = transactions.isEmpty
        emptyLabel.isHidden = !transactions.isEmpty
        if let totalAmount = UserDefaults.standard.string(forKey: SettingsViewController.submissionKey) {
            data.text = "Total amount: $\(totalAmount)";
            let less = transactions.filter({ $0.amount < totalAmount }).count
            let greater = transactions.filter({ $0.amount > totalAmount }).count
            transactionLabel.text = "There are \(transactions.count) transactions"
            transactionInfo.text = "There are \(less) transactions less than set limited | There are \(greater) transactions greater than set limited"
        }
    }
}
