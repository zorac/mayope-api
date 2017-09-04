using System;
using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Requests;
{
    /// <summary>
    /// A request for a list of branches.
    /// </summary>
    public class ListBranchesRequest : AuthenticatedRequest
    {
        [Required]
        public Guid Tree { get; set; }
    }
}
