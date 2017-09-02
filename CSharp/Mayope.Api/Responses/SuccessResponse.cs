using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Responses;
{
    public class SuccessResponse : Response
    {
        [Required]
        public bool Success { get; set; }
    }
}
