using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MVCInicial.Startup))]
namespace MVCInicial
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
