using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TMS_WebForms.Startup))]
namespace TMS_WebForms
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
