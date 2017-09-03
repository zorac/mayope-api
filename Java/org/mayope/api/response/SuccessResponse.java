package org.mayope.api.response;

/**
 * A geneic boolean success/failure response.
 */
public class SuccessResponse extends Response {
    /**
     * True if the operation succeeded, false otherwise.
     */
    private boolean success;

    /**
     * Get true if the operation succeeded, false otherwise.
     *
     * @return The value
     */
    public boolean getSuccess() {
        return success;
    }

    /**
     * Set true if the operation succeeded, false otherwise.
     *
     * @param success The new value
     */
    public void setSuccess(boolean success) {
        this.success = success;
    }
}
