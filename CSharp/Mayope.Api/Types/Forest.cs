using System.Collections.Generic;

namespace Mayope.Api.Types;
{
    /// <summary>
    /// Details of a forest.
    /// </summary>
    public class Forest : Node
    {
        /// <summary>
        /// The children of this forest; empty if none, null if this is a stub
        /// record.
        /// </summary>
        public IList<Forest> Forests { get; set; }

        /// <summary>
        /// The trees within this forest; empty if none, null if this is a stub
        /// record.
        /// </summary>
        public IList<Tree> Trees { get; set; }
    }
}
