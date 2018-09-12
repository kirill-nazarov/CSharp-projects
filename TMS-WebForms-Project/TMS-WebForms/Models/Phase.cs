using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace TMS_WebForms.Models
{
    public class Phase
    {
        [ScaffoldColumn(false)]
        public int PhaseID { get; set; }

        [Required, StringLength(100)]
        public string PhaseName { get; set; }

        public virtual ICollection<Form> Forms { get; set; }
    }
}