using System;

namespace Mayope.Api.Requests;
{
    /// <summary>
    /// A request for a list of forests.
    /// </summary>
    public class ListForestsRequest : AuthenticatedRequest
    {
        public Guid Parent { get; set; }
    }
}
