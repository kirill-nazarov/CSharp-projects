using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace TMS_WebForms.Models
{
    public class Discipline
    {
        [ScaffoldColumn(false)]
        public int DisciplineID { get; set; }

        [Required, StringLength(100)]
        public string DisciplineName { get; set; }

        public virtual ICollection<Form> Forms { get; set; }

    }
}