package org.mayope.api.types;

/**
 * A type of error.
 */
public enum ErrorType {
    /**
     * An unknown error.
     */
    Unknown,
    /**
     * The input was invalid.
     */
    Validation,
    /**
     * An authentication failure (i.e. invalid credentials, etc).
     */
    Authentication,
    /**
     * An authorization failure (i.e. user does not have access).
     */
    Authorization;
}
