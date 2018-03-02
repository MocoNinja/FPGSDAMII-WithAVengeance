using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ConProcedimientos.Startup))]
namespace ConProcedimientos
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
