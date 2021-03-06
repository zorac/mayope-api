// <auto-generated>
// This code was auto-generated by the Mayope API builder.
// </auto-generated>

using System;
using System.ComponentModel.DataAnnotations;

using Newtonsoft.Json;

namespace Mayope.Api.Responses
{
    /// <summary>
    /// A successful login response including the authentication token to use
    /// in future authenticated requests.
    /// </summary>
    public class LoginResponse : IResponse
    {
        /// <summary>
        /// An authentication token to use in future requests.
        /// </summary>
        [Required]
        [JsonRequired]
        public Guid Token { get; set; }
    }
}
