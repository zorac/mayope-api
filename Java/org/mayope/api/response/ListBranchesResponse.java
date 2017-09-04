package org.mayope.api.response;

import java.util;

import org.mayope.api.types;

/**
 * A response containing a list of branches.
 */
public class ListBranchesResponse {
    private List<Branch> branches;

    public List<Branch> getBranches() {
        return branches;
    }

    public void setBranches(List<Branch> branches) {
        this.branches = branches;
    }
}
