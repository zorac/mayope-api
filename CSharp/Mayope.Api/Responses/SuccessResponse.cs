using System.ComponentModel.DataAnnotations;

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
        public bool Success { get; set; }
    }
}
