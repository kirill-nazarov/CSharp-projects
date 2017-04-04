using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;


namespace TMS_WebForms.Models
{
    public class Status
    {
        [ScaffoldColumn(false)]
        public int StatusID { get; set; }

        [Required, StringLength(100)]
        public string StatusName { get; set; }

        public virtual ICollection<Form> Forms { get; set; }
    }
}