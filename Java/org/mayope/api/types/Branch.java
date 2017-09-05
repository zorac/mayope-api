package org.mayope.api.types;

/**
 * Details of a branch in a Mayope schema.
 */
public class Branch extends Node {
    /**
     * The type of the branch's value.
     */
    private String type;

    /**
     * The child branches if the type involves a Tree.
     */
    private Branch branches;

    /**
     * Get the type of the branch's value.
     *
     * @return The value
     */
    public String getType() {
        return type;
    }

    /**
     * Set the type of the branch's value.
     *
     * @param type The new value
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * Get the child branches if the type involves a Tree.
     *
     * @return The value
     */
    public Branch getBranches() {
        return branches;
    }

    /**
     * Set the child branches if the type involves a Tree.
     *
     * @param branches The new value
     */
    public void setBranches(Branch branches) {
        this.branches = branches;
    }
}
