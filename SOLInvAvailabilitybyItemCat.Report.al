report 50121 SOLInvAvailabilitybyItemCat
{
    ApplicationArea = All;
    Caption = 'Inventory and Availability by Item Category';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './SOLInvAvailabilitybyItemCat.rdl';
    ExcelLayout = './SOLInvAvailabilitybyItemCat.xlsx';

    DefaultLayout = Excel;

    dataset
    {
        dataitem(item; item)
        {
            Calcfields = Inventory, "Qty. on Sales Order", "Qty. on Purch. Order";

            column(ItemCategoryCode; "Item Category Code")
            {
                IncludeCaption = true;
            }
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
            column(Availability; Availability)
            {
            }
            dataitem(ItemCategory; "Item Category")
            {
                DataItemLink = Code = field("Item Category Code");

                column(ItemCategoryDescription; Description)
                {
                    IncludeCaption = true;
                }
            }

            trigger OnAfterGetRecord()
            begin

                Availability := Inventory - "Qty. on Sales Order" + "Qty. on Purch. Order";
            end;
        }

    }

    labels
    {
        ReportTitle_Lbl = 'Inventory and Availability, by Item Category';
        AvailabilityCaption_Lbl = 'Availability';
    }

    var
        Availability: Decimal;
        

}
