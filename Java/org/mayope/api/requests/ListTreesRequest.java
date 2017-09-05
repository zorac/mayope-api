package org.mayope.api.requests;

import java.util;

/**
 * A request for a list of trees.
 */
public class ListTreesRequest extends AuthenticatedRequest {
    /**
     * The UUID of the forest to list the trees in.
     */
    private UUID forest;

    /**
     * Get the UUID of the forest to list the trees in.
     *
     * @return The value
     */
    public UUID getForest() {
        return forest;
    }

    /**
     * Set the UUID of the forest to list the trees in.
     *
     * @param forest The new value
     */
    public void setForest(UUID forest) {
        this.forest = forest;
    }
}
