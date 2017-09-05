using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

using Mayope.Api.Types;

namespace Mayope.Api.Responses;
{
    /// <summary>
    /// An error response. This may be returned as an alternative response to
    /// any action, normally with an error indication in the underlying protocol
    /// (e.g. a 4xx or 5xx HTTP status code).
    /// </summary>
    public class ErrorResponse : IResponse
    {
        /// <summary>
        /// A code giving the type of error which occurred.
        /// </summary>
        [Required]
        public ErrorType Error { get; set; }

        /// <summary>
        /// A more detailed, human-readable error message.
        /// </summary>
        public string Message { get; set; }

        /// <summary>
        /// Additional details of the error.
        /// </summary>
        public IDictionary<string,string> Details { get; set; }
    }
}
