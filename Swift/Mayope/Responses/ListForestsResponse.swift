//
// This code was auto-generated by the Mayope API builder.
//

import Foundation

/// A response containing a list of forests.
public class ListForestsResponse {
    /// The UUID of the parent forest, or null if the root forests.
    var parent: UUID { get set }

    /// The forests found, empty if none.
    var forests: Array<Forest> { get set }
}