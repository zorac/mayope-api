using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

using Mayope.Api.Types;

namespace Mayope.Api.Responses;
{
    /// <summary>
    /// A response containing a list of forests.
    /// </summary>
    public class ListForestsResponse
    {
        [Required]
        public IList<Forest> Forests { get; set; }
    }
}
