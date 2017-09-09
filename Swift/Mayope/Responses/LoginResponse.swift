//
// This code was auto-generated by the Mayope API builder.
//

import Foundation

/// A successful login response including the authentication token to use in
/// future authenticated requests.
public class LoginResponse : Response {
    /// An authentication token to use in future requests.
    var token: UUID { get set }
}
