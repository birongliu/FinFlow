//
//  ViewController.swift
//  FinFlow
//
//  Created by Bi Rong Liu on 4/13/24.
//

import UIKit
import AuthenticationServices

class LoginController: UIViewController, ASWebAuthenticationPresentationContextProviding {
    @IBOutlet var welcomeLabel: UILabel!
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return view.window!
    }
    
    @IBOutlet var discordBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonActions(_ sender: Any) {
        getSession(type: .discord)
    }
    
    private func getSession(type: NetworkAuthManager.AuthType) {
        let manager = NetworkAuthManager();
        guard let loginURL = URL(string: NetworkAuthManager.AuthURL.login.rawValue) else { return };
        let session = ASWebAuthenticationSession(url: loginURL, callbackURLScheme: manager.getScheme(), completionHandler: { (callbackURL, error) in
            guard error == nil, let callbackURL = callbackURL else { return };
            guard let query = URLComponents(string: callbackURL.absoluteString) else { return }
            guard let queryCode = query.queryItems?.filter({ $0.name == "code"}).first else { return }
            Task {
                do {
                    guard let code = queryCode.value else { return }
                    let token = try await manager.getTokenQuery(code: String(code), url: .token).makeRequest(context: Token.self)
                    let user = try await manager.getUserQuery(accessToken: token.access, url: .user).makeRequest(context: User.self)
                    let userData = try JSONEncoder().encode(user)
                    UserDefaults.standard.set(userData, forKey: NetworkAuthManager.userKey)
                   self.performSegue(withIdentifier: "loginToHome", sender: self)
                } catch {
                    print(error)
                }
            }
        })
        session.presentationContextProvider = self
        session.start();
    }
}


