using System;
using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Requests;
{
    /// <summary>
    /// A request for a list of trees.
    /// </summary>
    public class ListTreesRequest : AuthenticatedRequest
    {
        [Required]
        public Guid Forest { get; set; }
    }
}
