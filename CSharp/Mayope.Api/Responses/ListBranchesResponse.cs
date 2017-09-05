using System;
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
        /// <summary>
        /// The UUID of the tree.
        /// </summary>
        [Required]
        public Guid Tree { get; set; }

        /// <summary>
        /// The branches in the tree, empty if none.
        /// </summary>
        [Required]
        public IList<Branch> Branches { get; set; }
    }
}
