using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace TMS_WebForms.Models
{
    public class Type
    {
        [ScaffoldColumn(false)]
        public int TypeID { get; set; }

        [Required, StringLength(100)]
        public string TypeName { get; set; }

        public virtual ICollection<Form> Forms { get; set; }
    }
}