using System;
using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Types;
{
    /// <summary>
    /// A node in a Myaope schema.
    /// </summary>
    public abstract class Node
    {
        /// <summary>
        /// A universally unique identifier for the node.
        /// </summary>
        [Required]
        public Guid Uuid { get; set; }

        /// <summary>
        /// An ID which must be unique amongst sibling nodes.
        /// </summary>
        [Required]
        public string Id { get; set; }

        /// <summary>
        /// A plain-text name for the node.
        /// </summary>
        [Required]
        public string Name { get; set; }

        /// <summary>
        /// A free-text description of the node.
        /// </summary>
        [Required]
        public string Description { get; set; }
    }
}
