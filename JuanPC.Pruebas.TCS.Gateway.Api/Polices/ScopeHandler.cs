using Microsoft.AspNetCore.Authorization;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Threading.Tasks;

namespace JuanPC.Pruebas.TCS.Gateway.Api.Polices
{
    [ExcludeFromCodeCoverage]
    public class ScopeHandler : AuthorizationHandler<ScopeRequirement>
    {
        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, ScopeRequirement requirement)
        {
            if (context.User.HasClaim(x => x.Type == "" && x.Issuer == requirement.Issuer))
            {
                string[] Scope = context.User.FindFirst(c => c.Type == "" &&
                                                             c.Issuer == requirement.Issuer).Value.Split(' ');

                if (Scope.Any(c => c == requirement.Scope))
                    context.Succeed(requirement);

            }
            return Task.CompletedTask;
        }

    }
}
