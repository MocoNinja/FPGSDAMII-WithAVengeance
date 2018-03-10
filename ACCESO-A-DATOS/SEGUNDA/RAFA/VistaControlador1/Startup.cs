using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VistaControlador1.Startup))]
namespace VistaControlador1
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
