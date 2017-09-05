using System;
using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Requests;
{
    /// <summary>
    /// A request for a list of trees.
    /// </summary>
    public class ListTreesRequest : AuthenticatedRequest
    {
        /// <summary>
        /// The UUID of the forest to list the trees in.
        /// </summary>
        [Required]
        public Guid Forest { get; set; }
    }
}
