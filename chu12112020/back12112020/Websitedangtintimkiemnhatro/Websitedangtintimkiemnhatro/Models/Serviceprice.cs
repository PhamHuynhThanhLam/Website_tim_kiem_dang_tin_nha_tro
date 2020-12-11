using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Websitedangtintimkiemnhatro.Models
{
    public class Serviceprice
    {
        [Key]
        public int Id { get; set; }
        public string Typeofnew { get; set; }
        public float Price { get; set; }

        public int Date { get; set; }
        public ICollection<Bill> Bills { get; set; }
    }
}
