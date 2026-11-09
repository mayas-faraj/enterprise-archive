/*using System.Collections.Generic;
using System.Globalization;
using System.IO;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Hosting.Server.Features;*/

using System;
using System.Threading;
using System.Threading.Tasks;
using System.Net.Http;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Builder;

namespace Petrotech
{
    public class Startup
    {
        /*public IConfiguration Configuration {get; }
        
        public Startup(IConfiguration configuration)
        {
            configuration=configuration;
        }*/
        
        public void ConfigureServices(IServiceCollection services)
        {
            //services.AddControllers();
        }

        public void Configure(IApplicationBuilder app)
        {
            /*app.UseRouting();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });*/
            /*
            var serverAddressesFeature =   app.ServerFeatures.Get<IServerAddressesFeature>();
            app.UseStaticFiles();
            app.Run(async (context) =>
            {
                context.Response.ContentType = "text/html"; 
                await context.Response
                    .WriteAsync("<!DOCTYPE html><html lang=\"en\"><head>" +
                                "<title></title></head><body><p>Hosted by Kestrel</p>");

                if (serverAddressesFeature != null)
                {
                    await context.Response
                        .WriteAsync("<p>Listening on the following addresses: " +
                                    string.Join(", ", serverAddressesFeature.Addresses) +
                                    "</p>");
                }

                await context.Response.WriteAsync("<p>Request URL: " +
                                                  $"{context.Request.GetDisplayUrl()}<p>");
            });*/

            app.Run(context =>
			{
				var data = System.Text.Encoding.UTF8.GetBytes("Hello World from the ASP.Net CORE!");
				context.Response.Body.Write(data, 0, data.Length);
				
				return Task.CompletedTask;
			});
        }
    }
}