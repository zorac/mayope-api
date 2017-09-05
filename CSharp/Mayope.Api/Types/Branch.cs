using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Types;
{
    /// <summary>
    /// Details of a branch in a Mayope schema.
    /// </summary>
    public class Branch : Node
    {
        /// <summary>
        /// The type of the branch's value.
        /// </summary>
        [Required]
        public string Type { get; set; }

        /// <summary>
        /// The child branches if the type involves a Tree.
        /// </summary>
        public Branch Branches { get; set; }
    }
}
