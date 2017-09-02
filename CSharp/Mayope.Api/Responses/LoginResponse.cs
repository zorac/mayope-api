using System;
using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Responses;
{
    public class LoginResponse : Response
    {
        [Required]
        public Guid Token { get; set; }
    }
}
