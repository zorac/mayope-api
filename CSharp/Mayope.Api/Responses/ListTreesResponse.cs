using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

using Mayope.Api.Types;

namespace Mayope.Api.Responses;
{
    /// <summary>
    /// A response containing a list of trees.
    /// </summary>
    public class ListTreesResponse
    {
        /// <summary>
        /// The UUID of the forest.
        /// </summary>
        [Required]
        public Guid Forest { get; set; }

        /// <summary>
        /// The trees in the forest, empty if none.
        /// </summary>
        [Required]
        public IList<Tree> Trees { get; set; }
    }
}
