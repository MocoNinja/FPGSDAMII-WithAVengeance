using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AD07.Startup))]
namespace AD07
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
