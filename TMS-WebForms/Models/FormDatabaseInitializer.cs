using System.Collections.Generic;
using System.Data.Entity;

namespace TMS_WebForms.Models
{
    public class FormDatabaseInitializer : DropCreateDatabaseAlways<FormContext>
    {
        protected override void Seed(FormContext context)
        {
            GetDisciplines().ForEach(c => context.Disciplines.Add(c));
            GetTypes().ForEach(c => context.Types.Add(c));
            GetPhases().ForEach(c => context.Phases.Add(c));
            GetStatuses().ForEach(c => context.Statuses.Add(c));
            GetForms().ForEach(c => context.Forms.Add(c));
        }

        private static List<Discipline> GetDisciplines()
        {
            var disciplines = new List<Discipline>
            {
                new Discipline
                {
                    DisciplineID = 1,
            DisciplineName = "Civil"
        },
                       new Discipline
                {
                    DisciplineID = 2,
                    DisciplineName = "HVAC"
                },
                       new Discipline
                {
                    DisciplineID = 3,
                    DisciplineName = "Electrical"
                },
                       new Discipline
                {
                    DisciplineID = 4,
                    DisciplineName = "Instrumentation"
                },
                      new Discipline
                {
                    DisciplineID = 5,
                    DisciplineName = "Mechanical"
                },
                     new Discipline
                {
                    DisciplineID = 6,
                    DisciplineName = "Piping"
                },
                     new Discipline
                {
                    DisciplineID = 7,
                    DisciplineName = "Structural"
                },
                     new Discipline
                {
                    DisciplineID = 8,
                    DisciplineName = "Telecomm"
                },
            };
            return disciplines;
        }
        private static List<Type> GetTypes()
        {
            var types = new List<Type> {
                new Type
                {
                    TypeID = 1,
                    TypeName = "Construction"
                },
                new Type
                {
                    TypeID = 2,
                    TypeName = "Precomissioning"
                },
             };
            return types;
        }

        private static List<Phase> GetPhases()
        {
            var phases = new List<Phase> {
                new Phase
                {
                    PhaseID = 1,
                    PhaseName = "Construction"
                },
                new Phase
                {
                    PhaseID = 2,
                    PhaseName = "Commissioning"
                },
                new Phase
                {
                    PhaseID = 3,
                    PhaseName = "Pre-Commissioning"
                },
            };
            return phases;
        }

        private static List<Status> GetStatuses()
        {
            var statuses = new List<Status>
            {
                new Status
                {
                    StatusID = 1,
                    StatusName = "Active"
                },
                                new Status
                {
                    StatusID = 2,
                    StatusName = "Cancelled"
                },
                                new Status
                {
                    StatusID = 3,
                    StatusName = "Suspended"
                },
            };
            return statuses;
        }

        private static List<Form> GetForms()
        {
            var forms = new List<Form> {
            new Form
            {
                FormID = 1,
                FormName = "CCL002A",
                DescriptionEng = "Civil checklist",
                DescriptionRu = "Общестроительный чеклист",
                DisciplineID = 1,
                TypeID = 1,
                PhaseID = 1,
                StatusID = 1,
                Revision = 3,
                date = "01.01.2005"
            },
             new Form
            {
                FormID = 2,
                FormName = "CCL002B",
                DescriptionEng = "Civil checklist commissioning",
                DescriptionRu = "Общестроительный чеклист при пуско наладке",
                DisciplineID = 1,
                TypeID = 1,
                PhaseID = 2,
                StatusID = 2,
                Revision = 2,
                date = "03.10.2010"
            },
               new Form
            {
                FormID = 3,
                FormName = "I-018",
                LinkToFile = "/FORMS/I-018.pdf",
                DescriptionEng = "Commissioning Act",
                DescriptionRu = "Акт приемки работ",
                DisciplineID = 2,
                TypeID = 2,
                PhaseID = 3,
                StatusID = 3,
                Revision = 5,
                date = "02.01.2006"
            },
        };
            return forms;
        }
    }


}
