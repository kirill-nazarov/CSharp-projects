using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace TMS_WebForms.Models
{
    public class FormContext :DbContext
    {
        public FormContext() : base ("TMS_Local")
        {
        }
        public DbSet<Discipline> Disciplines { get; set; }
        public DbSet<Type> Types { get; set; }
        public DbSet<Phase> Phases { get; set; }
        public DbSet<Status> Statuses { get; set; }
        public DbSet<Form> Forms { get; set; }

    }
}