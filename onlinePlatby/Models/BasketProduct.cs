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
    
    public partial class BasketProduct
    {
        public int BasketId { get; set; }
        public int ProductVariantId { get; set; }
        public Nullable<bool> generateBool { get; set; }
    
        public virtual Basket Basket { get; set; }
        public virtual ProductVariant ProductVariant { get; set; }
    }
}
