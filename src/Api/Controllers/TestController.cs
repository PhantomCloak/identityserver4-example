using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Api.Controllers
{
    [Authorize]
    public class IdentityController : ControllerBase
    {
        [HttpGet]
        [Route("read")]
        [Authorize("ModOnly")]
        public IActionResult GetContents()
        {
            var str = from c in User.Claims select new {c.Type, c.Value};
            return Ok("Your claims are " + JsonConvert.SerializeObject(str));
        }

        [HttpGet]
        [Route("write")]
        [Authorize("AdminOnly")]
        public async Task<IActionResult> ShareCotntents(string content)
        {
            return Ok("You Write the content");
        }
    }
}