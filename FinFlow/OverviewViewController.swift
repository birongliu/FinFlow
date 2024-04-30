//
//  OverviewViewController.swift
//  FinFlow
//
//  Created by Bi Rong Liu on 4/22/24.
//

import UIKit

class OverviewViewController: UIViewController {
    
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var lowAmountCountLabel: UILabel!
    
    @IBOutlet var emptyLabel: UILabel!
 
    @IBOutlet var highAmountCountLabel: UILabel!
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
        //data.isHidden = transactions.isEmpty;
        transactionLabel.isHidden = transactions.isEmpty
        emptyLabel.isHidden = !transactions.isEmpty
        if let totalAmount = UserDefaults.standard.string(forKey: SettingsViewController.submissionKey) {
            amountLabel.text = "Threshold Limit: $\(totalAmount)";
            let less = transactions.filter({ $0.amount < totalAmount }).count
            let greater = transactions.filter({ $0.amount > totalAmount }).count
            transactionLabel.text = "There are \(transactions.count) transactions"
            lowAmountCountLabel.text = "Less: \(less)";
            highAmountCountLabel.text = "Greater: \(greater)";
            
        }
    }
}
