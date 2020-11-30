using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Websitedangtintimkiemnhatro.Models
{
    public class Convesation_reply
    {
        [Key]
        public int Id { get; set; }
        public int Reply { get; set; }
        public DateTime Time { get; set; }
        public string Status { get; set; }
        public User User { get; set; }
        [ForeignKey("UserId")]
        [Required]
        public int UserId { get; set; }

        public Convesation Convesation { get; set; }
        [ForeignKey("ConvesationId")]
        [Required]
        public int ConvesationId { get; set; }
    }
}
