using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using System;
using System.Diagnostics.CodeAnalysis;
using System.IO;
using System.Reflection;

namespace JuanPC.Pruebas.TCS.Gateway.Api.Core.DependencyInjection
{
    [ExcludeFromCodeCoverage]
    public static class SwaggerCollectionExtensions
    {
        public static IServiceCollection AddSwagger(this IServiceCollection services)
        {
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo 
                { 
                    Title = "JuanPC.Pruebas.TCS.Gateway.Api", 
                    Version = "v1" ,
                    Description = "Pruebas TCS"
                });
            });           
            return services;
        }
       
    }
}
