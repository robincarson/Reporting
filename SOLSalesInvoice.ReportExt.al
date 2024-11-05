reportextension 50120 SOLSalesInvoice extends "Standard Sales - Invoice"
{
    dataset
    {
        add(Header)
        {
            column(BoolField; BoolField)
            { }
        }
    }
    requestpage
    {
        layout
        {
            addlast(Options)
            {
                field(BoolField; BoolField)
                { 
                    ApplicationArea = All;
                    Caption = 'Boolean Field';
                }
            }
        }
    }
    var
        BoolField: Boolean;
}

