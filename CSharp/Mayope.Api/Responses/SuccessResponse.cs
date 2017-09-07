using System.ComponentModel.DataAnnotations;

using Newtonsoft.Json;

namespace Mayope.Api.Responses;
{
    /// <summary>
    /// A geneic boolean success/failure response.
    /// </summary>
    public abstract class SuccessResponse : IResponse
    {
        /// <summary>
        /// True if the operation succeeded, false otherwise.
        /// </summary>
        [Required]
        [JsonRequired]
        public bool Success { get; set; }
    }
}
