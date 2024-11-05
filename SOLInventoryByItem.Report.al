report 50120 SOLInventoryByItem
{
    ApplicationArea = All;
    
    Caption = 'Inventory By Item';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './SOLInventoryByItem.rdlc';
    DefaultLayout = RDLC;
    
    dataset
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(Inventory; Inventory)
            {
                IncludeCaption = true;
            }
        }
    }
}
