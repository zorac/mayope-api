/*
 * This code was auto-generated by the Mayope API builder.
 */

package org.mayope.api.types;

import java.util;

/**
 * Details of a branch in a Mayope schema.
 */
public class Branch extends Node {
    /**
     * The type of the branch's value.
     */
    private BranchType type;

    /**
     * Additional size specifiers for the type if needed.
     */
    private List<Integer> sizes;

    /**
     * The child branch type(s) if not a single-valued type.
     */
    private List<Branch> branches;

    /**
     * Get the type of the branch's value.
     *
     * @return The value
     */
    public BranchType getType() {
        return type;
    }

    /**
     * Set the type of the branch's value.
     *
     * @param type A new value
     */
    public void setType(BranchType type) {
        this.type = type;
    }

    /**
     * Get additional size specifiers for the type if needed.
     *
     * @return The value
     */
    public List<Integer> getSizes() {
        return sizes;
    }

    /**
     * Set additional size specifiers for the type if needed.
     *
     * @param sizes A new value
     */
    public void setSizes(List<Integer> sizes) {
        this.sizes = sizes;
    }

    /**
     * Get the child branch type(s) if not a single-valued type.
     *
     * @return The value
     */
    public List<Branch> getBranches() {
        return branches;
    }

    /**
     * Set the child branch type(s) if not a single-valued type.
     *
     * @param branches A new value
     */
    public void setBranches(List<Branch> branches) {
        this.branches = branches;
    }
}
