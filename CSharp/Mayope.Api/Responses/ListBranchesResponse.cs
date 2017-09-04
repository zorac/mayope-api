using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

using Mayope.Api.Types;

namespace Mayope.Api.Responses;
{
    /// <summary>
    /// A response containing a list of branches.
    /// </summary>
    public class ListBranchesResponse
    {
        [Required]
        public IList<Branch> Branches { get; set; }
    }
}
