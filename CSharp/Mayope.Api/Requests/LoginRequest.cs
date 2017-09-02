using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Requests;
{
    public class LoginRequest : Request
    {
        [Required]
        public string Username { get; set; }

        [Required]
        public string Password { get; set; }
    }
}
