package org.mayope.api.request;

/**
 * A login request, including username/password credentials.
 */
public class LoginRequest extends Request {
    /**
     * The username to log in with.
     */
    private String username;

    /**
     * The user's password.
     */
    private String password;

    /**
     * Get the username to log in with.
     *
     * @return The value
     */
    public String getUsername() {
        return username;
    }

    /**
     * Set the username to log in with.
     *
     * @param username The new value
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * Get the user's password.
     *
     * @return The value
     */
    public String getPassword() {
        return password;
    }

    /**
     * Set the user's password.
     *
     * @param password The new value
     */
    public void setPassword(String password) {
        this.password = password;
    }
}
