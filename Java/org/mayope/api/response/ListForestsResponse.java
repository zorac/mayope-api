package org.mayope.api.response;

import java.util;

import org.mayope.api.types;

/**
 * A response containing a list of forests.
 */
public class ListForestsResponse {
    private List<Forest> forests;

    public List<Forest> getForests() {
        return forests;
    }

    public void setForests(List<Forest> forests) {
        this.forests = forests;
    }
}
