//
//  Transaction.swift
//  FinFlow
//
//  Created by Bi Rong Liu on 4/21/24.
//

import Foundation

struct Transaction: Codable, Equatable {
    var title: String
    var amount: String
    var category: String
    var createdAt: Date;
    var id: String = UUID().uuidString;
    init(title: String, amount: String, category: String) {
        self.title = title;
        self.amount = amount;
        self.category = category
        self.createdAt = Date();
    }
}

extension Transaction {
    public static var transactionKey = "transactions"
    static func save(_ transaction: [Transaction]) {
        let encodedData = try! JSONEncoder().encode(transaction);
        UserDefaults.standard.set(encodedData, forKey: transactionKey);
    }

    static func getTransaction() -> [Transaction] {
        if let data = UserDefaults.standard.data(forKey: transactionKey) {
            let decodedData = try! JSONDecoder().decode([Transaction].self, from: data)
            
            return decodedData;
        }
        return []
    }
    
    func save() {
        var transactions = Transaction.getTransaction();
        if let transactionIndex = transactions.firstIndex(where: { $0.id == self.id }) {
            transactions.remove(at: transactionIndex)
            transactions.insert(self, at: transactionIndex)
            Transaction.save(transactions)
        } else {
            transactions.append(self);
            Transaction.save(transactions)
        }
    }
}
