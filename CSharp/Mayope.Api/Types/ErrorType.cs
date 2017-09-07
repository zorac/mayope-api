using Newtonsoft.Json;

namespace Mayope.Api.Types;
{
    /// <summary>
    /// A type of error.
    /// </summary>
    [JsonConverter(typeof(StringEnumConverter))]
    public enum ErrorType
    {
        /// <summary>
        /// An unknown error.
        /// </summary>
        Unknown,
        /// <summary>
        /// The input was invalid.
        /// </summary>
        Validation,
        /// <summary>
        /// An authentication failure (i.e. invalid credentials, etc).
        /// </summary>
        Authentication,
        /// <summary>
        /// An authorization failure (i.e. user does not have access).
        /// </summary>
        Authorization
    }
}
