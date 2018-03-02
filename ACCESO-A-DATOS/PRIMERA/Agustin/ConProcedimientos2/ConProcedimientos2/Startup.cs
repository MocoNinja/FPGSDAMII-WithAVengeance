using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ConProcedimientos2.Startup))]
namespace ConProcedimientos2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
