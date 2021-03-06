//
// This code was auto-generated by the Mayope API builder.
//

import Foundation

/// A request including an authentication token.
public class AuthenticatedRequest : Request {
    /// A token authenticating the user.
    var token: UUID { get set }
}
