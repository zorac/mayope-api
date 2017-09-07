using System;
using System.ComponentModel.DataAnnotations;

using Newtonsoft.Json;

namespace Mayope.Api.Requests;
{
    /// <summary>
    /// A request for a list of branches.
    /// </summary>
    public class ListBranchesRequest : AuthenticatedRequest
    {
        /// <summary>
        /// The UUID of the tree to list the branches in.
        /// </summary>
        [Required]
        [JsonRequired]
        public Guid Tree { get; set; }
    }
}
