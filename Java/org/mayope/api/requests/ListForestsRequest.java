package org.mayope.api.requests;

import java.util;

/**
 * A request for a list of forests.
 */
public class ListForestsRequest extends AuthenticatedRequest {
    /**
     * The UUID of a forest to list the children of, or null for the root
     * forests.
     */
    private UUID parent;

    /**
     * Get the UUID of a forest to list the children of, or null for the root
     * forests.
     *
     * @return The value
     */
    public UUID getParent() {
        return parent;
    }

    /**
     * Set the UUID of a forest to list the children of, or null for the root
     * forests.
     *
     * @param parent The new value
     */
    public void setParent(UUID parent) {
        this.parent = parent;
    }
}
