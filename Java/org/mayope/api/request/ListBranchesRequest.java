package org.mayope.api.request;

import java.util;

/**
 * A request for a list of branches.
 */
public class ListBranchesRequest extends AuthenticatedRequest {
    private UUID tree;

    public UUID getTree() {
        return tree;
    }

    public void setTree(UUID tree) {
        this.tree = tree;
    }
}
