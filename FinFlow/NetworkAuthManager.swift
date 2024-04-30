//
//  NetworkAuthManager.swift
//  FinFlow
//
//  Created by Bi Rong Liu on 4/19/24.
//

import Foundation

class NetworkAuthManager {
    private enum AuthError: Error {
        case invalidAuthURL
        case missingRequest
        case noSession
    }
    public static var userKey: String = "userKey"
    public enum AuthURL : String {
        case login = "http://192.168.1.154:3000/api/authentication/discord/login";
        case token = "http://192.168.1.154:3000/api/authentication/token"
        case user = "http://192.168.1.154:3000/api/users/@me"
    }
    
    public enum AuthType : String {
        case discord = "discord"
    }
    
    public func getScheme() -> String {
        return "finFlow"
    }
    
    private var request: URLRequest?;
    public func getURLRequest(url: String) throws -> URLRequest {
        guard let url = URL(string: url) else { throw AuthError.invalidAuthURL }
        return URLRequest(url: url);
    }
    
    public func getTokenQuery(code: String, url: AuthURL) throws -> NetworkAuthManager {
        var request = try self.getURLRequest(url: url.rawValue);
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = "code=\(String(code))".data(using: .utf8);
        self.request = request;
        return self;
    }
    
    public func getUserQuery(accessToken: String, url: AuthURL) throws -> NetworkAuthManager {
        var request = try self.getURLRequest(url: url.rawValue)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        self.request = request;
        return self;
    }
    
    public func makeRequest<T: Decodable>(context: T.Type) async throws -> T {
        guard let request = self.request else { throw AuthError.missingRequest }
        let (data, _) = try await URLSession.shared.data(for: request);
        let result = try JSONDecoder().decode(T.self, from: data)
        return result;
    }
    public static func getProfile() -> User? {
        guard let userData = UserDefaults.standard.data(forKey: userKey) else { return nil };
        return try! JSONDecoder().decode(User.self, from: userData) as User;
    }
}

public struct Token: Decodable {
    var access: String
    var refresh: String
    init(access: String, refresh: String) {
        self.access = access
        self.refresh = refresh
    }
}

public struct User: Decodable, Encodable {
    var avatarURL: URL
    var fetchAt: String
    var id: String
    var username: String
    init(avatarURL: URL, fetchAt: String, id: String, username: String) {
        self.avatarURL = avatarURL
        self.fetchAt = fetchAt
        self.id = id
        self.username = username
    }
}
