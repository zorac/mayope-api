package org.mayope.api.responses;

import java.util;

import org.mayope.api.types;

/**
 * A response containing a list of branches.
 */
public class ListBranchesResponse {
    /**
     * The UUID of the tree.
     */
    private UUID tree;

    /**
     * The branches in the tree, empty if none.
     */
    private List<Branch> branches;

    /**
     * Get the UUID of the tree.
     *
     * @return The value
     */
    public UUID getTree() {
        return tree;
    }

    /**
     * Set the UUID of the tree.
     *
     * @param tree The new value
     */
    public void setTree(UUID tree) {
        this.tree = tree;
    }

    /**
     * Get the branches in the tree, empty if none.
     *
     * @return The value
     */
    public List<Branch> getBranches() {
        return branches;
    }

    /**
     * Set the branches in the tree, empty if none.
     *
     * @param branches The new value
     */
    public void setBranches(List<Branch> branches) {
        this.branches = branches;
    }
}
