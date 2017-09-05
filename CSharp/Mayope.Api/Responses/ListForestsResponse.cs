using System;
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
        /// <summary>
        /// The UUID of the parent forest, or null if the root forests.
        /// </summary>
        public Guid Parent { get; set; }

        /// <summary>
        /// The forests found, empty if none.
        /// </summary>
        [Required]
        public IList<Forest> Forests { get; set; }
    }
}
