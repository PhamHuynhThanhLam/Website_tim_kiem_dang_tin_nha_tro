﻿using System;
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
            return await _context.Motels.Include(e => e.Detail).Include(e => e.User).Include(e => e.Images).Where(a => a.Status == "Tin đang hiển thị").ToListAsync();  
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

        ////Tin search price decreas
        //[HttpGet]
        //[Route("Decrease/{name}")]
        //public async Task<ActionResult<IEnumerable<Motel>>> GetDecreases(string name)
        //{
        //    return await _context.Motels.Include(a => a.Detail).ThenInclude(a => a.Typeofnew).Include(e => e.Images).Where(a => a.Status == "Tin đang hiển thị" && a.Detail.Typeofnew.Name == name).OrderByDescending(e => e.Price).ToListAsync();
        //}

        ////Tin search price increase
        //[HttpGet]
        //[Route("Increase/{name}")]
        //public async Task<ActionResult<IEnumerable<Motel>>> GetDecreases(string name)
        //{
        //    return await _context.Motels.Include(a => a.Detail).ThenInclude(a => a.Typeofnew).Include(e => e.Images).Where(a => a.Status == "Tin đang hiển thị" && a.Detail.Typeofnew.Name == name).OrderByDescending(e => e.Price).ToListAsync();
        //}

        //Tin nổi bật
        [HttpGet]
        [Route("Highlights")]
        public async Task<ActionResult<IEnumerable<Motel>>> GetHighlights()
        {
            return await _context.Motels.Include(a => a.Detail).ThenInclude(a => a.Typeofnew).Include(e => e.Images).Where(a => a.Typeservice == "Tin Hot" && a.Status == "Tin đang hiển thị" && a.Verify == true).OrderByDescending(e => e.Price).Take(5).ToListAsync();
        }

        //Tin vừa đăng
        [HttpGet]
        [Route("Nows")]
        public async Task<ActionResult<IEnumerable<Motel>>> GetNows()
        {
            return await _context.Motels.Include(a => a.Detail).ThenInclude(a => a.Typeofnew).Include(e => e.Images).Where(a => a.Status == "Tin đang hiển thị" && a.Verify == true).OrderByDescending(e => e.DateUpdate).Take(20).ToListAsync();
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
        [HttpPut]
        [Route("PutMotelExtend/{id}")]
        public async Task<IActionResult> PutMotelExtend(int id, Motel motel)
        {
            if (id != motel.Id)
            {
                return BadRequest();
            }

            DateTime daydue = DateTime.Now;
            string[] xet = motel.Time.Split(" ");

            if (xet[1].Equals("Tháng"))
            {
                motel.DateDue = daydue.AddMonths(int.Parse(xet[0]));
            }
            else if (xet[1].Equals("Ngày"))
            {
                TimeSpan aInterval = new System.TimeSpan(int.Parse(xet[0]), 0, 0, 0);
                motel.DateDue = daydue.Add(aInterval);
            }
            else if (xet[1].Equals("Tuần"))
            {
                int day = int.Parse(xet[0]) * 7;
                motel.DateDue = daydue.AddDays(day);
            }

            motel.DateUpdate = DateTime.Now;
            motel.Status = "Tin đang ẩn";
            motel.Verify = false;

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

            return CreatedAtAction("GetMotel", new { id = motel.Id }, motel);
        }

        [HttpPut]
        [Route("PutMotelNV/{id}")]
        public async Task<IActionResult> PutMotelNV(int id, Motel motel)
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

            return CreatedAtAction("GetMotel", new { id = motel.Id }, motel);
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
                motel.DateDue = daydue.AddMonths(int.Parse(xet[0]));
            }
            else if (xet[1].Equals("Ngày"))
            {
                TimeSpan aInterval = new System.TimeSpan(int.Parse(xet[0]), 0, 0, 0);
                motel.DateDue = daydue.Add(aInterval);
            }
            else if (xet[1].Equals("Tuần"))
            {
                int day = int.Parse(xet[0]) * 7;
                motel.DateDue = daydue.AddDays(day);
            }
            
            motel.DateUpdate = DateTime.Now;
            motel.Verify = false;
            _context.Motels.Add(motel);
            await _context.SaveChangesAsync();
            int id = motel.Id;
            _context.Details.Add(motel.Detail);

            if (motel.Images.Count == 0)
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

        // GET: api/Motels/GetMotel/name
        [HttpGet]
        [Route("GetMotelOutOfDate")]
        public async Task<ActionResult<IEnumerable<Motel>>> GetMotelOutOfDate()
        {
            var motels = await _context.Motels
                .Include(m => m.Detail)
                .ToListAsync();

            DateTime now = DateTime.Now;

            for(int i=0; i< motels.Count; i++)
            {
                int result = DateTime.Compare(now, motels[i].DateDue);
                if (result == 1 && motels[i].Status == "Tin đang hiển thị")
                {
                    motels[i].Status = "Tin đã hết hạn";
                    motels[i].Verify = false;
                    _context.Entry(motels[i]).State = EntityState.Modified;
                    await _context.SaveChangesAsync();
                }
            }



            return Content("");
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
                .Include(m => m.Images)
                .Where(a => a.Detail.Typeofnew.Name == name && a.Status == "Tin đang hiển thị" && a.Verify == true).OrderByDescending(a => a.Detail.TypeofnewId).ToListAsync();

            if (models == null)
            {
                return NotFound();
            }

            return models;
        }

        // GET: api/Motels/GetMotelUser/name
        [HttpGet]
        [Route("GetMotelUser/{id}")]
        public async Task<ActionResult<IEnumerable<Motel>>> GetMotelUser(int id)
        {
            var models = await _context.Motels
                .Include(m => m.Detail)
                .ThenInclude(m => m.Typeofnew)
                .Include(m => m.Images)
                .Where(a => a.UserId == id).ToListAsync();

            if (models == null)
            {
                return NotFound();
            }

            return models;
        }

        // GET: api/Motels/GetMotelByType
        [HttpGet]
        [Route("GetMotelAdmin")]
        public async Task<ActionResult<IEnumerable<Motel>>> GetMotelAdmin()
        {
            var models = await _context.Motels
                .Include(m => m.Detail)
                .ThenInclude(m => m.Typeofnew)
                .Include(m => m.Images)
                .ToListAsync();

            if (models == null)
            {
                return NotFound();
            }

            return models;
        }

        // GET: api/Motels/GetMotelNV
        [HttpGet]
        [Route("GetMotelNV")]
        public async Task<ActionResult<IEnumerable<Motel>>> GetMotelNV()
        {
            var models = await _context.Motels
                .Include(m => m.Detail)
                .ThenInclude(m => m.Typeofnew)
                .Include(m => m.Images)
                .ToListAsync();

            if (models == null)
            {
                return NotFound();
            }

            return models;
        }

        [HttpGet]
        [Route("TopHot")]
        public async Task<ActionResult> GetMotelTopHots()
        {
            var list = await _context.Motels.Where(a => a.Typeservice == "Tin Hot").ToListAsync();
            return Content(list.Count.ToString());
        }

        [HttpGet]
        [Route("TopHot30")]
        public async Task<ActionResult> GetMotelTop30s()
        {
            var list = await _context.Motels.Where(a => a.Typeservice == "Tin VIP 3").ToListAsync();
            return Content(list.Count.ToString());
        }

        [HttpGet]
        [Route("TopHot20")]
        public async Task<ActionResult> GetMotelTop20s()
        {
            var list = await _context.Motels.Where(a => a.Typeservice == "Tin VIP 2").ToListAsync();
            return Content(list.Count.ToString());
        }

        [HttpGet]
        [Route("TopHot10")]
        public async Task<ActionResult> GetMotelTop10s()
        {
            var list = await _context.Motels.Where(a => a.Typeservice == "Tin VIP 1").ToListAsync();
            return Content(list.Count.ToString());
        }

        [HttpGet]
        [Route("TopThuong")]
        public async Task<ActionResult> GetMotelTopThuongs()
        {
            var list = await _context.Motels.Where(a => a.Typeservice == "Tin thường").ToListAsync();
            return Content(list.Count.ToString());
        }

        //barchart
        [HttpGet]
        [Route("CountPriceDuoi1Trieu")]
        public async Task<ActionResult> GetMotelCountPriceDuoi1Trieu()
        {
      
            var list = await _context.Motels.ToListAsync();
            double count = 0;
            for(int  i =0;i <list.Count; i++)
            {
                if (list[i].PriceType.Equals("triệu/tháng") && float.Parse(list[i].Price) < 1.0000)
                {
                    count++;
                }
                if (list[i].PriceType.Equals("đồng/tháng") && Int32.Parse(list[i].Price) < 999)
                {
                    count++;
                }
            }
            return Content(count.ToString());
        }

        [HttpGet]
        [Route("CountPrice1To2Trieu")]
        public async Task<ActionResult> GetMotelCountPrice1To2Trieu()
        {
            var list = await _context.Motels.ToListAsync();
            double count = 0;
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].PriceType.Equals("triệu/tháng") && (float.Parse(list[i].Price) < 2.0000 && float.Parse(list[i].Price) >= 1.0000))
                {
                    count++;
                }
            }
            return Content(count.ToString());
        }

        [HttpGet]
        [Route("CountPrice2To3Trieu")]
        public async Task<ActionResult> GetMotelCountPrice2To3Trieu()
        {

            var list = await _context.Motels.ToListAsync();
            double count = 0;
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].PriceType.Equals("triệu/tháng") && (float.Parse(list[i].Price) < 3.0000 && float.Parse(list[i].Price) >= 2.0000))
                {
                    count++;
                }
            }
            return Content(count.ToString());
        }

        [HttpGet]
        [Route("CountPrice3To5Trieu")]
        public async Task<ActionResult> GetMotelCountPrice3To5Trieu()
        {

            var list = await _context.Motels.ToListAsync();
            double count = 0;
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].PriceType.Equals("triệu/tháng") && (float.Parse(list[i].Price) < 5.0000 && float.Parse(list[i].Price) >= 3.0000))
                {
                    count++;
                }
            }
            return Content(count.ToString());
        }

        [HttpGet]
        [Route("CountPrice5To7Trieu")]
        public async Task<ActionResult> GetMotelCountPrice5To37Trieu()
        {

            var list = await _context.Motels.ToListAsync();
            double count = 0;
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].PriceType.Equals("triệu/tháng") && (float.Parse(list[i].Price) < 7.0000 && float.Parse(list[i].Price) >= 5.0000))
                {
                    count++;
                }
            }
            return Content(count.ToString());
        }

        [HttpGet]
        [Route("CountPrice7To10Trieu")]
        public async Task<ActionResult> GetMotelCountPrice7To10Trieuu()
        {

            var list = await _context.Motels.ToListAsync();
            double count = 0;
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].PriceType.Equals("triệu/tháng") && (float.Parse(list[i].Price) < 10.0000 && float.Parse(list[i].Price) >= 7.0000))
                {
                    count++;
                }
            }
            return Content(count.ToString());
        }

        [HttpGet]
        [Route("CountPrice10To15Trieu")]
        public async Task<ActionResult> GetMotelCountPrice10To15Trieu()
        {

            var list = await _context.Motels.ToListAsync();
            double count = 0;
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].PriceType.Equals("triệu/tháng") && (float.Parse(list[i].Price) < 15.0000 && float.Parse(list[i].Price) >= 10.0000))
                {
                    count++;
                }
            }
            return Content(count.ToString());
        }

        [HttpGet]
        [Route("CountPriceTren15Trieu")]
        public async Task<ActionResult> GetMotelCountPriceTren15Trieu()
        {

            var list = await _context.Motels.ToListAsync();
            double count = 0;
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].PriceType.Equals("triệu/tháng") && float.Parse(list[i].Price) >= 15.0000)
                {
                    count++;
                }
            }
            return Content(count.ToString());
        }
        //

        // Số người đăng
        [HttpGet]
        [Route("CountUserPublish")]
        public async Task<ActionResult<IEnumerable<UserPublishMotel>>> GetMotelCountUserPublish()
        {
            var userPublishMotelList = new List<UserPublishMotel>();
            var listdata = new List<UserPublishMotel>();
            var list = await _context.Motels.OrderBy(a => a.UserId).ToListAsync();
            var listuser = await _context.Users.ToListAsync();
            double count = 0;
            string hovaten = "";
            for (int i = 0; i < listuser.Count; i++)
            {
                hovaten = listuser[i].HovaTen;
                for (int j = 0; j < list.Count; j++)
                {
                    
                    if (listuser[i].Id == list[i].UserId)
                    {                      
                        count++;
                    }
                }
                UserPublishMotel userPublishMotel = new UserPublishMotel()
                {
                    HovaTen = hovaten,
                    Total = count
                };
                userPublishMotelList.Add(userPublishMotel);
                count = 0;
            }
            listdata = userPublishMotelList.OrderByDescending(a => a.Total).Take(5).ToList();
            return listdata;
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
            motels.Motels = _context.Motels.Where(a => a.Status == "Tin đang hiển thị" && a.Verify == true).ToList();
            motels.Details = _context.Details.Include(a => a.Typeofnew).Select(c => new Detail { Id = c.Id, NumberBath = c.NumberBath, NumberLiving = c.NumberLiving }).ToList();
            motels.Cities = _context.Citys.Include(a => a.Provinces).Where(a => a.Name == motel.City.Name).Select(c => new City { Id = c.Id, Name = c.Name }).ToList();
            motels.Images = _context.Images.Select(c => new Image { Id = c.Id, ImageMotel = c.ImageMotel }).ToList();

            return motels;
        }


        // GET: api/Motels/GetMotelByProvince/name
        [HttpGet]
        [Route("GetMotelByProvince/{name}")]
        public async Task<ActionResult<IEnumerable<Motel>>> GetMotelByProvince(string name)
        {
            var models = await _context.Motels
                .Include(m => m.Detail)
                .ThenInclude(m => m.Typeofnew)
                .Include(m => m.Images)
                .Where(a => a.Province.Name == name && a.Status == "Tin đang hiển thị" && a.Verify == true).ToListAsync();

            if (models == null)
            {
                return NotFound();
            }

            return models;
        }
    }
}
