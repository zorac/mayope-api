using System;
using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Requests;
{
    public class AuthenticatedRequest : Request
    {
        [Required]
        public Guid Token { get; set; }
    }
}
