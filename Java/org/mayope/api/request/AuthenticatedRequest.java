package org.mayope.api.request;

import java.util;

/**
 * A request including an authentication token.
 */
public class AuthenticatedRequest extends Request {
    /**
     * A token authenticating the user.
     */
    private UUID token;

    /**
     * Get a token authenticating the user.
     *
     * @return The value
     */
    public UUID getToken() {
        return token;
    }

    /**
     * Set a token authenticating the user.
     *
     * @param token The new value
     */
    public void setToken(UUID token) {
        this.token = token;
    }
}
