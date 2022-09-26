using Microsoft.AspNetCore.Mvc;
using WebAPICar.Data;
using WebAPICar.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebAPICar.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CarsController : ControllerBase
    {
        // GET: api/<CarsController>
        [HttpGet]
        public List<Cars> Get()
        {
            return DataCar.GetAll();
        }

        // GET api/<CarsController>/5
        [HttpGet("{brand}")]
        public List<Cars> Get(string brand)
        {
            return DataCar.GetByID(brand);
        }

        // POST api/<CarsController>
        [HttpPost]
        public string Post([FromForm] Cars car)
        {
            return DataCar.CreateCar(car);
        }

        // PUT api/<CarsController>/5
        [HttpPut("{id}")]
        public string Put([FromForm] Cars car)
        {
            return DataCar.Update(car);

        }

        // DELETE api/<CarsController>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            return DataCar.Delete(id);
        }
    }
}
