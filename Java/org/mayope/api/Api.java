package org.mayope.api;

import org.mayope.api.requests;
import org.mayope.api.responses;

/**
 * The Mayope API.
 */
public interface Api {
    /**
     * The login action.
     */
    LoginResponse login(LoginRequest request);

    /**
     * The logout action.
     */
    LogoutResponse logout(LogoutRequest request);

    /**
     * The forest list action.
     */
    ListForestsResponse listForests(ListForestsRequest request);

    /**
     * The tree list action.
     */
    ListTreesResponse listTrees(ListTreesRequest request);

    /**
     * The branch list action.
     */
    ListBranchesResponse listBranches(ListBranchesRequest request);
}
