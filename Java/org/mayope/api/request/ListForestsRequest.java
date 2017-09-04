package org.mayope.api.request;

import java.util;

/**
 * A request for a list of forests.
 */
public class ListForestsRequest extends AuthenticatedRequest {
    private UUID parent;

    public UUID getParent() {
        return parent;
    }

    public void setParent(UUID parent) {
        this.parent = parent;
    }
}
