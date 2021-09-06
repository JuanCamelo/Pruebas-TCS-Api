using JuanPC.Pruebas.TCS.Core;
using JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login;
using JuanPC.Pruebas.TCS.Core.Aplication.Commands.Login.Contracts;
using JuanPC.Pruebas.TCS.Core.NewFolder;
using JuanPC.Pruebas.TCS.Gateway.Api.Polices;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.DependencyInjection;
using System.Diagnostics.CodeAnalysis;

namespace JuanPC.Pruebas.TCS.Gateway.Api.Core.DependencyInjection
{
    public static class ConfigurationServiceCollectionExtensions
    {
        [ExcludeFromCodeCoverage]
        public static IServiceCollection AddConfigurationServices(this IServiceCollection services)
        {
            services.AddSingleton<IAuthorizationHandler, ScopeHandler>();

            #region Aplication
            services.AddTransient<IWordCount, WordCountAppService>();
            services.AddTransient<ILoginApp, LoginAppService>();
            #endregion

            #region Infrastructure

            #endregion

            return services;
        }
    }
}
