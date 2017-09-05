package org.mayope.api.types;

import java.util;

/**
 * Details of a tree.
 */
public class Tree extends Node {
    /**
     * The branches within this tree; empty if none, null if this is a stub
     * record.
     */
    private List<Branch> branches;

    /**
     * Get the branches within this tree; empty if none, null if this is a stub
     * record.
     *
     * @return The value
     */
    public List<Branch> getBranches() {
        return branches;
    }

    /**
     * Set the branches within this tree; empty if none, null if this is a stub
     * record.
     *
     * @param branches The new value
     */
    public void setBranches(List<Branch> branches) {
        this.branches = branches;
    }
}
