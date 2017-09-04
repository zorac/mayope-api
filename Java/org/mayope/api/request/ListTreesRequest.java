package org.mayope.api.request;

import java.util;

/**
 * A request for a list of trees.
 */
public class ListTreesRequest extends AuthenticatedRequest {
    private UUID forest;

    public UUID getForest() {
        return forest;
    }

    public void setForest(UUID forest) {
        this.forest = forest;
    }
}
