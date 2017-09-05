package org.mayope.api.responses;

import java.util;

import org.mayope.api.types;

/**
 * An error response. This may be returned as an alternative response to any
 * action, normally with an error indication in the underlying protocol (e.g. a
 * 4xx or 5xx HTTP status code).
 */
public class ErrorResponse implements Response {
    /**
     * A code giving the type of error which occurred.
     */
    private ErrorType error;

    /**
     * A more detailed, human-readable error message.
     */
    private String message;

    /**
     * Additional details of the error.
     */
    private Map<String,String> details;

    /**
     * Get a code giving the type of error which occurred.
     *
     * @return The value
     */
    public ErrorType getError() {
        return error;
    }

    /**
     * Set a code giving the type of error which occurred.
     *
     * @param error The new value
     */
    public void setError(ErrorType error) {
        this.error = error;
    }

    /**
     * Get a more detailed, human-readable error message.
     *
     * @return The value
     */
    public String getMessage() {
        return message;
    }

    /**
     * Set a more detailed, human-readable error message.
     *
     * @param message The new value
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * Get additional details of the error.
     *
     * @return The value
     */
    public Map<String,String> getDetails() {
        return details;
    }

    /**
     * Set additional details of the error.
     *
     * @param details The new value
     */
    public void setDetails(Map<String,String> details) {
        this.details = details;
    }
}