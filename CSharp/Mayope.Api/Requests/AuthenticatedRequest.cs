using System;
using System.ComponentModel.DataAnnotations;

using Newtonsoft.Json;

namespace Mayope.Api.Requests;
{
    /// <summary>
    /// A request including an authentication token.
    /// </summary>
    public abstract class AuthenticatedRequest : IRequest
    {
        /// <summary>
        /// A token authenticating the user.
        /// </summary>
        [Required]
        [JsonRequired]
        public Guid Token { get; set; }
    }
}
