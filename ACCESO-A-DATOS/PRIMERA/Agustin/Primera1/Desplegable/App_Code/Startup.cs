using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Primera1.Startup))]
namespace Primera1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
