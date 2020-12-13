using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Websitedangtintimkiemnhatro.Models;
using Websitedangtintimkiemnhatro.ViewModels;

namespace Websitedangtintimkiemnhatro.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MotelsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public MotelsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Motels
        [HttpGet]
        [ActionName("GetMotels")]
        public async Task<ActionResult<IEnumerable<Motel>>> GetMotels()
        {
            return await _context.Motels.Include(e => e.Detail).Include(e => e.City).Include(e => e.Province).Include(e => e.User).Include(e => e.Images).ToListAsync();  
        }
        [HttpGet]
        [ActionName("GetMotelsAsync")]
        [Route("User")]
        public async Task<ActionResult<MotelViewModel>> GetMotelsAsync()
        {
            MotelViewModel motels = new MotelViewModel();
            motels.Motels = _context.Motels.Include(e => e.Detail).Include(e => e.City).Include(e => e.Images).ToList();
            motels.Details = _context.Details.Include(a => a.Typeofnew).Select(c => new Detail { Id = c.Id, NumberBath = c.NumberBath, NumberLiving = c.NumberLiving }).ToList();
            motels.Cities = _context.Citys.Include(a => a.Provinces).Select(c => new City { Id = c.Id, Name = c.Name }).ToList();
            motels.Images = _context.Images.Select(c => new Image { Id = c.Id,ImageMotel = c.ImageMotel }).ToList();

            return motels;
        }

        //Tin nổi bật
        [HttpGet]
        [Route("Highlights")]
        public async Task<ActionResult<IEnumerable<Motel>>> GetHighlights()
        {
            return await _context.Motels.Include(a => a.Detail).ThenInclude(a => a.Typeofnew).Include(e => e.Images).Where(a => a.Typeservice == "Tin Hot").OrderByDescending(e => e.Price).Take(5).ToListAsync();
        }

        //Tin vừa đăng
        [HttpGet]
        [Route("Nows")]
        public async Task<ActionResult<IEnumerable<Motel>>> GetNows()
        {
            return await _context.Motels.Include(a => a.Detail).ThenInclude(a => a.Typeofnew).Include(e => e.Images).OrderByDescending(e => e.DateUpdate).Take(20).ToListAsync();
        }

        // GET: api/Motels/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Motel>> GetMotel(int id)
        {
            var motel = await _context.Motels.Include(a => a.City).Include(a => a.User).Include(a => a.Detail).ThenInclude(a => a.Typeofnew).Include(e => e.Images).FirstAsync(a => a.Id == id);

            if (motel == null)
            {
                return NotFound();
            }

            return motel;
        }

        // PUT: api/Motels/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMotel(int id, Motel motel)
        {
            if (id != motel.Id)
            {
                return BadRequest();
            }

            _context.Entry(motel).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MotelExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        private int ktnam(double nam)
        {
            if ((nam % 4 == 0 && nam % 100 != 0) || nam % 400 == 0)
            {
                return 1;
            }
            else return 0;
        }

        private int ktthang(int thang, double nam)
        {
            int dem = 0;
            if (thang == 2)
            {
                int t = ktnam(nam);
                if (t == 1)
                    dem = 29;
                else dem = 28;
            }
            if (thang == 1 || thang == 3 || thang == 5 || thang == 7 || thang == 8 || thang == 10 || thang == 12)
                dem = 31;
            if (thang == 4 || thang == 6 || thang == 9 || thang == 11)
                dem = 30;
            return dem;
        }

        // POST: api/Motels
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<Motel>> PostMotel(Motel motel)
        {
            DateTime daydue = DateTime.Now;
            string[] xet = motel.Time.Split(" ");
            if (xet[1].Equals("Tháng"))
            {
                daydue.AddMonths(int.Parse(xet[0]));
            }
            else if (xet[1].Equals("Ngày"))
            {
                daydue.AddDays(int.Parse(xet[0]));
            }
            else if (xet[1].Equals("Tuần"))
            {
                int day = int.Parse(xet[0]) * 7;
                daydue.AddDays(day);
            }
            motel.DateDue = daydue;
            motel.DateUpdate = DateTime.Now;
            motel.Verify = false;
            _context.Motels.Add(motel);
            await _context.SaveChangesAsync();
            int id = motel.Id;
            _context.Details.Add(motel.Detail);
            
            if(motel.Images.Count == 0)
            {
                ///return NotFound();
                return CreatedAtAction("GetMotel", new { id = motel.Id }, motel);
            }
            else
            {
                for (int i = 0; i < motel.Images.Count; i++)
                {
                    motel.Images.ElementAt(i).MotelId = id;
                }

                _context.Images.AddRange(motel.Images);
            }
           


            ////_context.Bills.Add(motel.Bill);
            //await _context.SaveChangesAsync();

            return CreatedAtAction("GetMotel", new { id = motel.Id }, motel);
        }

        // DELETE: api/Motels/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Motel>> DeleteMotel(int id)
        {
            var motel = await _context.Motels.FindAsync(id);
            if (motel == null)
            {
                return NotFound();
            }

            _context.Motels.Remove(motel);
            await _context.SaveChangesAsync();

            return motel;
        }

        // GET: api/Motels/GetMotel/name
        [HttpGet]
        [Route("GetMotel/{name}")]
        public async Task<ActionResult<IEnumerable<Motel>>> GetMotelSearch(string name)
        {
            var models = await _context.Motels
                .Include(m => m.Detail)
                .Where((a => a.Title.ToLower().Contains(name.ToLower()))).ToListAsync();

            if (models == null)
            {
                return NotFound();
            }

            return models;
        }
        private bool MotelExists(int id)
        {
            return _context.Motels.Any(e => e.Id == id);
        }


        // GET: api/Motels/GetMotelByType/name
        [HttpGet]
        [Route("GetMotelByType/{name}")]
        public async Task<ActionResult<IEnumerable<Motel>>> GetMotelByType(string name)
        {
            var models = await _context.Motels
                .Include(m => m.Detail)
                .ThenInclude(m => m.Typeofnew)
                .Include(m => m.City)
                .Include(m => m.Province)
                .Include(m => m.Images)
                .Where(a => a.Detail.Typeofnew.Name == name).ToListAsync();

            if (models == null)
            {
                return NotFound();
            }

            return models;
        }


        // GET: api/Motels/GetMotelForSearch
        [HttpGet]
        [Route("GetMotelForSearch")]
        public async Task<ActionResult<MotelViewModel>> GetMotelForSearch(Motel motel)
        {
            MotelViewModel motels = new MotelViewModel();
            if (motel.City.Name != null)
            {
                motels.Motels = _context.Motels.Include(e => e.Detail).Include(e => e.City)
                          .Where((a => a.City.Name == motel.City.Name)).Include(e => e.Images).ToList();
            }
            if (motel.Province.Name != null)
            {
                motels.Motels = _context.Motels.Include(e => e.Detail).Include(e => e.City)
                          .Where((a => a.Province.Name == motel.Province.Name)).Include(e => e.Images).ToList();
            }
            if (motel.Address != null)
            {
                motels.Motels = _context.Motels.Include(e => e.Detail).Include(e => e.City)
                         .Where((a => a.Address.ToLower().Contains(motel.Address.ToLower())
                         )).Include(e => e.Images).ToList();
            }

            if (motel.Title != null)
            {
                motels.Motels = _context.Motels.Include(e => e.Detail).Include(e => e.City)
                            .Where((a => a.Title.ToLower().Contains(motel.Title.ToLower())
                            )).Include(e => e.Images).ToList();
            }
      
            motels.Details = _context.Details.Include(a => a.Typeofnew).Select(c => new Detail { Id = c.Id, NumberBath = c.NumberBath, NumberLiving = c.NumberLiving }).ToList();
            motels.Cities = _context.Citys.Include(a => a.Provinces).Where(a => a.Name == motel.City.Name).Select(c => new City { Id = c.Id, Name = c.Name }).ToList();
            motels.Images = _context.Images.Select(c => new Image { Id = c.Id, ImageMotel = c.ImageMotel }).ToList();

            return motels;
        }
    }
}
