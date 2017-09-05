package org.mayope.api.responses;

import java.util;

import org.mayope.api.types;

/**
 * A response containing a list of trees.
 */
public class ListTreesResponse {
    /**
     * The UUID of the forest.
     */
    private UUID forest;

    /**
     * The trees in the forest, empty if none.
     */
    private List<Tree> trees;

    /**
     * Get the UUID of the forest.
     *
     * @return The value
     */
    public UUID getForest() {
        return forest;
    }

    /**
     * Set the UUID of the forest.
     *
     * @param forest The new value
     */
    public void setForest(UUID forest) {
        this.forest = forest;
    }

    /**
     * Get the trees in the forest, empty if none.
     *
     * @return The value
     */
    public List<Tree> getTrees() {
        return trees;
    }

    /**
     * Set the trees in the forest, empty if none.
     *
     * @param trees The new value
     */
    public void setTrees(List<Tree> trees) {
        this.trees = trees;
    }
}
