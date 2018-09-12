using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using TMS_WebForms.Models;

namespace TMS_WebForms
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       /* public IQueryable<Form> GetForms()
        {
            var _db = new TMS_WebForms.Models.FormContext();
            IQueryable<Form> query = _db.Forms;
            return query;
        }
        */

        public IQueryable<Form> GetForms([Control("cboDiscipline")]string Discipline = "")
        {
            var _db = new TMS_WebForms.Models.FormContext();
            IQueryable<Form> query = _db.Forms;

            return string.IsNullOrEmpty(Discipline) ?
                query.AsQueryable() :
                 query.Where(x => x.Discipline.DisciplineName == Discipline).AsQueryable();
        }

        public IQueryable<Discipline> GetDisciplines()
        {
            var _db = new TMS_WebForms.Models.FormContext();
            IQueryable<Discipline> query = _db.Disciplines;
            return query;
        }

        public IQueryable<Models.Type> GetTypes()
        {
            var _db = new TMS_WebForms.Models.FormContext();
            IQueryable<Models.Type> query = _db.Types;
            return query;
        }

        public IQueryable<Phase> GetPhases()
        {
            var _db = new TMS_WebForms.Models.FormContext();
            IQueryable<Phase> query = _db.Phases;
            return query;
        }

        public IQueryable<Status> GetStatuses()
        {
            var _db = new TMS_WebForms.Models.FormContext();
            IQueryable<Status> query = _db.Statuses;
            return query;
        }
        
    }
}