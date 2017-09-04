using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Types;
{
    /// <summary>
    /// Details of a tree.
    /// </summary>
    public class Tree
    {
        [Required]
        public Guid Uuid { get; set; }

        [Required]
        public string Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Description { get; set; }

        public IList<Branch> Branches { get; set; }
    }
}
