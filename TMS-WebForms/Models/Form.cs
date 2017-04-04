using System.ComponentModel.DataAnnotations;

namespace TMS_WebForms.Models
{
    public class Form
    {
        [ScaffoldColumn(false)]
        public int FormID { get; set; }

        [Required, StringLength(100), Display(Name ="Name")]
        public string FormName { get; set; }

        [StringLength(200), Display(Name = "Link")]
        public string LinkToFile { get; set; }

        [Required, StringLength(100), Display(Name = "Description Eng")]
        public string DescriptionEng { get; set; }

        [Required, StringLength(100), Display(Name = "Description Rus")]
        public string DescriptionRu { get; set; }

        public int? DisciplineID { get; set; }

        public virtual Discipline Discipline { get; set; }

        public int? TypeID { get; set; }

        public virtual Type Type { get; set; }

        public int? PhaseID { get; set; }

        public virtual Phase Phase { get; set; }

        [Required]
        public int Revision { get; set; }

        [Required, StringLength(10)]
        public string date { get; set; }

        public int? StatusID { get; set; }

        public virtual Status Status { get; set; }

    }
}