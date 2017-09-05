using System.Collections.Generic;

namespace Mayope.Api.Types;
{
    /// <summary>
    /// Details of a tree.
    /// </summary>
    public class Tree : Node
    {
        /// <summary>
        /// The branches within this tree; empty if none, null if this is a stub
        /// record.
        /// </summary>
        public IList<Branch> Branches { get; set; }
    }
}
