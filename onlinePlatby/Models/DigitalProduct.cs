//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace onlinePlatby.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DigitalProduct
    {
        public int Id { get; set; }
        public int ProductVariantId { get; set; }
        public string Name { get; set; }
        public string Url { get; set; }
        public System.DateTime CreatedAt { get; set; }
        public Nullable<System.DateTime> ExpirationDate { get; set; }
        public int DaysForDownload { get; set; }
    
        public virtual ProductVariant ProductVariant { get; set; }
    }
}
