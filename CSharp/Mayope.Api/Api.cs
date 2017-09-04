using Mayope.Api.Requests;
using Mayope.Api.Responses;

namespace Mayope.Api;
{
    /// <summary>
    /// The Mayope API.
    /// </summary>
    public class Api
    {
        /// <summary>
        /// The login action.
        /// <summary>
        public LoginResponse Login(LoginRequest request);

        /// <summary>
        /// The logout action.
        /// <summary>
        public SuccessResponse Logout(AuthenticatedRequest request);

        /// <summary>
        /// The forest list action.
        /// <summary>
        public ListForestsResponse ListForests(ListForestsRequest request);

        /// <summary>
        /// The tree list action.
        /// <summary>
        public ListTreesResponse ListTrees(ListTreesRequest request);

        /// <summary>
        /// The branch list action.
        /// <summary>
        public ListBranchesResponse ListBranches(ListBranchesRequest request);
    }
}
