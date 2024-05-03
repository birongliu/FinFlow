//
//  HomeViewController.swift
//  FinFlow
//
//  Created by Bi Rong Liu on 4/19/24.
//

import UIKit 

class TransactionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var emptyStateLabel: UILabel!
    var transactions = [Transaction]();
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.tableHeaderView = UIView()
        tableView.delegate = self;
        tableView.dataSource = self;
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshTransaction();
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count;
    }
    
    private func refreshTransaction() {
        let transactions = Transaction.getTransaction()
        self.transactions = transactions
        emptyStateLabel.isHidden = !transactions.isEmpty
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell;
        let transaction = transactions[indexPath.row]
        cell.configure(with: transaction, onCompleteButtonTapped: { transaction in
            transaction.save();
            self.refreshTransaction();
        })
        return cell;
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "composeSegue" {
            if let composeNavController = segue.destination as? UINavigationController,
               let composeViewController = composeNavController.topViewController as? CreateTransactionViewController {
                composeViewController.onComposeTransaction = { [weak self] transaction in
                    transaction.save()
                    self?.refreshTransaction()
                }
            }
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
