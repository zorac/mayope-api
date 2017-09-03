package org.mayope.api.response;

import java.util;

/**
 * A successful login response including the authentication token to use in
 * future authenticated requests.
 */
public class LoginResponse extends Response {
    /**
     * An authentication token to use in future requests.
     */
    private UUID token;

    /**
     * Get an authentication token to use in future requests.
     *
     * @return The value
     */
    public UUID getToken() {
        return token;
    }

    /**
     * Set an authentication token to use in future requests.
     *
     * @param token The new value
     */
    public void setToken(UUID token) {
        this.token = token;
    }
}
