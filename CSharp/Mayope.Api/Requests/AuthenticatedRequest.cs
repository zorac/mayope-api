using System;
using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Requests;
{
    /// <summary>
    /// A request including an authentication token.
    /// </summary>
    public class AuthenticatedRequest : Request
    {
        /// <summary>
        /// A token authenticating the user.
        /// </summary>
        [Required]
        public Guid Token { get; set; }
    }
}
