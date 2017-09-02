package org.mayope.api.response;

public class SuccessResponse extends Response {
    private boolean success;

    public boolean getSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }
}
