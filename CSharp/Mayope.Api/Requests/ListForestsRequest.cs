using System;

namespace Mayope.Api.Requests;
{
    /// <summary>
    /// A request for a list of forests.
    /// </summary>
    public class ListForestsRequest : AuthenticatedRequest
    {
        /// <summary>
        /// The UUID of a forest to list the children of, or null for the root
        /// forests.
        /// </summary>
        public Guid Parent { get; set; }
    }
}
