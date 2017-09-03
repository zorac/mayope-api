using System;
using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Responses;
{
    /// <summary>
    /// A successful login response including the authentication token to use in
    /// future authenticated requests.
    /// </summary>
    public class LoginResponse : Response
    {
        /// <summary>
        /// An authentication token to use in future requests.
        /// </summary>
        [Required]
        public Guid Token { get; set; }
    }
}
