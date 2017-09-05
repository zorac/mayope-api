package org.mayope.api.responses;

import java.util;

import org.mayope.api.types;

/**
 * A response containing a list of forests.
 */
public class ListForestsResponse {
    /**
     * The UUID of the parent forest, or null if the root forests.
     */
    private UUID parent;

    /**
     * The forests found, empty if none.
     */
    private List<Forest> forests;

    /**
     * Get the UUID of the parent forest, or null if the root forests.
     *
     * @return The value
     */
    public UUID getParent() {
        return parent;
    }

    /**
     * Set the UUID of the parent forest, or null if the root forests.
     *
     * @param parent The new value
     */
    public void setParent(UUID parent) {
        this.parent = parent;
    }

    /**
     * Get the forests found, empty if none.
     *
     * @return The value
     */
    public List<Forest> getForests() {
        return forests;
    }

    /**
     * Set the forests found, empty if none.
     *
     * @param forests The new value
     */
    public void setForests(List<Forest> forests) {
        this.forests = forests;
    }
}
