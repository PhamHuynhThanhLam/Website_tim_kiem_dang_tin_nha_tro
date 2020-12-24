using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Websitedangtintimkiemnhatro.Models
{
    public class Convesation
    {
        [Key]
        public int Id { get; set; }
        public DateTime Time { get; set; }
        public string Status { get; set; }
        public User UserOne { get; set; }
        [ForeignKey("UserOneId")]
        [Required]
        public int UserOneId { get; set; }

        public User UserTwo { get; set; }
        [ForeignKey("UserTwoId")]
        [Required]
        public int UserTwoId { get; set; }

        public ICollection<Convesation_reply> Convesation_replys { get; set; }

    }
}
