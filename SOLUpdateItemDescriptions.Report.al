report 50122 "SOLUpdateItemDescriptions"
{
    ApplicationArea = All;
    Caption = 'Update Item Descriptions';
    UsageCategory = Administration;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterHeading = 'Item Selection';
            RequestFilterFields = "No.", Description, "Description 2";

            trigger OnAfterGetRecord()
            var
                ItemToUpdate: Record Item;
            begin
                clear(ItemToUpdate);
                if ItemToUpdate.Get("No.") then begin
                    ItemToUpdate."Description 2" := CopyStr(StrSubstNo(Description_Lbl, Description, "No."), 1, MaxStrLen("Description 2"));
                    if ItemToUpdate.Modify() then
                        UpdatedRecords += 1;
                end;
            end;

            trigger OnPreDataItem()
            begin
                Clear(UpdatedRecords);
            end;

            trigger OnPostDataItem()
            begin
                Message('%1 Descriptions have been modified.', UpdatedRecords);
            end;
        }
    }

    var
        UpdatedRecords: Integer;
        Description_Lbl: Label '%1 (%2)', comment = '%1 - Descripton, %2 = Item No';
}
