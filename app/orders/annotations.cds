using mainsrv as service from '../../srv/mainsrv';

annotate service.Orders with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>OrderName}',
            Value : comment,
        },
    ]
);
annotate service.Orders with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>OrderName}',
                Value : comment,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Items',
            ID : 'Items',
            Target : 'Items/@UI.LineItem#Items',
        },
    ]
);
annotate service.OrderItems with @(

    UI.LineItem #Items : [
        {
            $Type : 'UI.DataField',
            Value : parent.Items.parent_ID,
            Label : 'parent_ID',
            ![@UI.Hidden],
        },{
            $Type : 'UI.DataField',
            Value : parent.Items.pos,
            Label : 'pos',
        },{
            $Type : 'UI.DataField',
            Value : parent.Items.quantity,
            Label : 'quantity',
        },]
);
annotate service.Orders with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : comment,
        },
        TypeName : '',
        TypeNamePlural : '',
    }
);