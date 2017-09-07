using Mayope.Api.Requests;
using Mayope.Api.Responses;

namespace Mayope.Api;
{
    /// <summary>
    /// A Mayope API Service.
    /// </summary>
    public interface IMayopeService
    {
        /// <summary>
        /// The login action.
        /// <summary>
        LoginResponse Login(LoginRequest request);

        /// <summary>
        /// The logout action.
        /// <summary>
        LogoutResponse Logout(LogoutRequest request);

        /// <summary>
        /// The forest list action.
        /// <summary>
        ListForestsResponse ListForests(ListForestsRequest request);

        /// <summary>
        /// The tree list action.
        /// <summary>
        ListTreesResponse ListTrees(ListTreesRequest request);

        /// <summary>
        /// The branch list action.
        /// <summary>
        ListBranchesResponse ListBranches(ListBranchesRequest request);
    }
}