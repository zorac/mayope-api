package org.mayope.api.response;

import java.util;

public class ErrorResponse extends Response {
    private String error;
    private String message;
    private Map<String,String> details;

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String,String> getDetails() {
        return details;
    }

    public void setDetails(Map<String,String> details) {
        this.details = details;
    }
}
