package org.mayope.api.requests;

import java.util;

/**
 * A request for a list of branches.
 */
public class ListBranchesRequest extends AuthenticatedRequest {
    /**
     * The UUID of the tree to list the branches in.
     */
    private UUID tree;

    /**
     * Get the UUID of the tree to list the branches in.
     *
     * @return The value
     */
    public UUID getTree() {
        return tree;
    }

    /**
     * Set the UUID of the tree to list the branches in.
     *
     * @param tree The new value
     */
    public void setTree(UUID tree) {
        this.tree = tree;
    }
}
