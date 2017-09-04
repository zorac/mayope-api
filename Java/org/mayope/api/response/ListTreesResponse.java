package org.mayope.api.response;

import java.util;

import org.mayope.api.types;

/**
 * A response containing a list of trees.
 */
public class ListTreesResponse {
    private List<Tree> trees;

    public List<Tree> getTrees() {
        return trees;
    }

    public void setTrees(List<Tree> trees) {
        this.trees = trees;
    }
}
