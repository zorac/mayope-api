package org.mayope.api.response;

import java.util;

public class LoginResponse extends Response {
    private UUID token;

    public UUID getToken() {
        return token;
    }

    public void setToken(UUID token) {
        this.token = token;
    }
}
