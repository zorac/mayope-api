package org.mayope.api.types;

import java.util;

/**
 * Details of a forest.
 */
public class Forest extends Node {
    /**
     * The children of this forest; empty if none, null if this is a stub
     * record.
     */
    private List<Forest> forests;

    /**
     * The trees within this forest; empty if none, null if this is a stub
     * record.
     */
    private List<Tree> trees;

    /**
     * Get the children of this forest; empty if none, null if this is a stub
     * record.
     *
     * @return The value
     */
    public List<Forest> getForests() {
        return forests;
    }

    /**
     * Set the children of this forest; empty if none, null if this is a stub
     * record.
     *
     * @param forests The new value
     */
    public void setForests(List<Forest> forests) {
        this.forests = forests;
    }

    /**
     * Get the trees within this forest; empty if none, null if this is a stub
     * record.
     *
     * @return The value
     */
    public List<Tree> getTrees() {
        return trees;
    }

    /**
     * Set the trees within this forest; empty if none, null if this is a stub
     * record.
     *
     * @param trees The new value
     */
    public void setTrees(List<Tree> trees) {
        this.trees = trees;
    }
}
