using System.Collections.Generic;
using System.Globalization;
using System.IO;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;

namespace Petrotech
{
    public class Startup
    {
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
        }
    }
}