using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MiConcesionario.Startup))]
namespace MiConcesionario
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
