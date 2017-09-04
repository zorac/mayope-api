package org.mayope.api;

import org.mayope.api.request;
import org.mayope.api.response;

/**
 * The Mayope API.
 */
public class API {
    /**
     * The login action.
     */
    public LoginResponse login(LoginRequest request);

    /**
     * The logout action.
     */
    public SuccessResponse logout(AuthenticatedRequest request);

    /**
     * The forest list action.
     */
    public ListForestsResponse listForests(ListForestsRequest request);

    /**
     * The tree list action.
     */
    public ListTreesResponse listTrees(ListTreesRequest request);

    /**
     * The branch list action.
     */
    public ListBranchesResponse listBranches(ListBranchesRequest request);
}
