using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Websitedangtintimkiemnhatro.Models
{
    public class User
    {
        [Key]
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime LastLogOnDate { get; set; }
        public string Email { get; set; }
        public bool Gender { get; set; }
        public string Title { get; set; }
        public byte[] UserImage { get; set; }
        public Account Account { get; set; }
        [ForeignKey("AccountId")]
        [Required]
        public int AccountId { get; set; }
        public BuyMoney BuyMoney { get; set; }
        public ICollection<Post> Posts { get; set; }
        public ICollection<Motel> Motels { get; set; }
        public ICollection<Convesation> Convesationuserones { get; set; }
        public ICollection<Convesation> Convesationusertwos { get; set; }
        public ICollection<Convesation_reply> Convesation_replys { get; set; }
    }
}
