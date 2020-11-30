using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Websitedangtintimkiemnhatro.Models;

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
        public async Task<ActionResult<IEnumerable<Motel>>> GetMotels()
        {
            return await _context.Motels.ToListAsync();
        }

        [HttpGet]
        [Route("Highlights")]
        public async Task<ActionResult<IEnumerable<Motel>>> GetHighlights()
        {
            return await _context.Motels.OrderByDescending(e => e.DateUpdate).Take(5).ToListAsync();
        }

        // GET: api/Motels/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Motel>> GetMotel(int id)
        {
            var motel = await _context.Motels.FindAsync(id);

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

        // POST: api/Motels
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<Motel>> PostMotel(Motel motel)
        {
            _context.Motels.Add(motel);
            await _context.SaveChangesAsync();

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
    }
}
