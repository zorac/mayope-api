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
        [Required]
        public IList<Tree> Trees { get; set; }
    }
}
