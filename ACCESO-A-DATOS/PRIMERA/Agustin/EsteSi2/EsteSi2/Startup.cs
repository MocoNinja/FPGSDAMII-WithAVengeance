using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EsteSi2.Startup))]
namespace EsteSi2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
