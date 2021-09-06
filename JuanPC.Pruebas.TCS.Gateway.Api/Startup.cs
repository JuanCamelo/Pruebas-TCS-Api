using JuanPC.Pruebas.TCS.Gateway.Api.Core.DependencyInjection;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System.Diagnostics.CodeAnalysis;

namespace JuanPC.Pruebas.TCS.Gateway.Api
{
    [ExcludeFromCodeCoverage]
    public class Startup
    {
        
        #region Properties
        public IConfiguration _configuration { get; }
        #endregion

        #region Builders
        public Startup(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        #endregion

        #region Methods
        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddControllers();
            ConfigurationServiceCollectionExtensions.AddConfigurationServices(services);
            SwaggerCollectionExtensions.AddSwagger(services);
            Authentication.AddAuthentication(services, _configuration);

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.ConfigureExceptionHandler();
            }

            AppBuilderExtensions.AddSwaggerCollection(app);

            app.UseCors(option =>
            {
                option.AllowAnyHeader();
                option.AllowAnyMethod();
            });

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
        #endregion

    }
}
