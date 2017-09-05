using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Requests;
{
    /// <summary>
    /// A login request, including username/password credentials.
    /// </summary>
    public class LoginRequest : IRequest
    {
        /// <summary>
        /// The username to log in with.
        /// </summary>
        [Required]
        public string Username { get; set; }

        /// <summary>
        /// The user's password.
        /// </summary>
        [Required]
        public string Password { get; set; }
    }
}
