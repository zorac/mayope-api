using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Mayope.Api.Responses;
{
    public class ErrorResponse : Response
    {
        [Required]
        public string Error { get; set; }

        public string Message { get; set; }

        public IDictionary<string,string> Details { get; set; }
    }
}
