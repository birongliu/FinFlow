//
//  TransactionCell.swift
//  FinFlow
//
//  Created by Bi Rong Liu on 4/22/24.
//

import UIKit

class TransactionCell: UITableViewCell {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var titleView: UITextView!
    @IBOutlet var amount: UILabel!
    var transaction: Transaction?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func update(with transaction: Transaction) {
        titleView.text = transaction.title;
        amount.text = "$\(transaction.amount)";
        let formatter = DateFormatter()
            formatter.dateStyle = .short;
        dateLabel.text = formatter.string(from: transaction.createdAt)
    }
    func configure(with transaction: Transaction, onCompleteButtonTapped: ((Transaction) -> Void)?) {
        self.transaction = transaction
        update(with: transaction)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
