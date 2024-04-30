//
//  CreateReceiptViewController.swift
//  FinFlow
//
//  Created by Bi Rong Liu on 4/20/24.
//

import UIKit

class CreateTransactionViewController: UIViewController {
    @IBOutlet var titleField: UITextField!
    @IBOutlet var amountSpendField: UITextField!
    @IBOutlet var categoryField: UITextField!
    private var editedTransaction: Transaction? = nil;
    public var onComposeTransaction: ((_ transaction: Transaction) -> Void)? = nil;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountSpendField.keyboardType = .decimalPad
        // Do any additional setup after loading the view.
        if let editedTransaction = editedTransaction {
            amountSpendField.text = String(editedTransaction.amount)
            categoryField.text = String(editedTransaction.category)
            titleField.text = String(editedTransaction.title)
            self.title = "Edit Transaction"
        }
    }
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func didTapDoneButton(_ sender: Any) {
        guard let title = titleField.text,
              !title.isEmpty
        else {
            presentAlert(title: "Oops...", message: "Make sure to add a title!")
            // ii.
            return
        }
        guard let amount = amountSpendField.text, !amount.isEmpty, (Double(amount) != nil) else {
            presentAlert(title: "Oops...", message: "Make sure to add a valid none empty amount Spend integer!")
            return
        }
        guard let category =  categoryField.text, !category.isEmpty else {
            presentAlert(title: "Oops...", message: "Make sure to add a amount Spend!")
            return
        }
        var transaction: Transaction
        if let editedTransaction = editedTransaction {
            transaction = editedTransaction;
            transaction.amount = editedTransaction.amount
            transaction.title = title
            transaction.category = editedTransaction.category
        } else {
            transaction = Transaction(title: title, amount: amount, category: category)
        }
        onComposeTransaction?(transaction);
        dismiss(animated: true)
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
