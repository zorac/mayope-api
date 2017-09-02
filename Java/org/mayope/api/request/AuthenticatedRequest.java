package org.mayope.api.request;

import java.util;

public class AuthenticatedRequest extends Request {
    private UUID token;

    public UUID getToken() {
        return token;
    }

    public void setToken(UUID token) {
        this.token = token;
    }
}
