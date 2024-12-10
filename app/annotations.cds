using { my_New_ProjectSrv } from '../srv/service.cds';

annotate my_New_ProjectSrv.Customers with @UI.HeaderInfo: { TypeName: 'Customer', TypeNamePlural: 'Customers', Title: { Value: customerNumber } };
annotate my_New_ProjectSrv.Customers with {
  ID @UI.Hidden @Common.Text: { $value: customerNumber, ![@UI.TextArrangement]: #TextOnly }
};
annotate my_New_ProjectSrv.Customers with @UI.Identification: [{ Value: customerNumber }];
annotate my_New_ProjectSrv.Customers with {
  email @title: 'Email';
  customerNumber @title: 'Customer Number';
  totalPurchaseValue @title: 'Total Purchase Value';
  totalRewardPoints @title: 'Total Reward Points';
  totalRedeemedRewardPoints @title: 'Total Redeemed Reward Points'
};

annotate my_New_ProjectSrv.Customers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: customerNumber },
    { $Type: 'UI.DataField', Value: totalPurchaseValue },
    { $Type: 'UI.DataField', Value: totalRewardPoints },
    { $Type: 'UI.DataField', Value: totalRedeemedRewardPoints }
];

annotate my_New_ProjectSrv.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: customerNumber },
    { $Type: 'UI.DataField', Value: totalPurchaseValue },
    { $Type: 'UI.DataField', Value: totalRewardPoints },
    { $Type: 'UI.DataField', Value: totalRedeemedRewardPoints }
  ]
};

annotate my_New_ProjectSrv.Customers with {
  purchases @Common.Label: 'Purchases';
  redemptions @Common.Label: 'Redemptions'
};

annotate my_New_ProjectSrv.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate my_New_ProjectSrv.Customers with @UI.SelectionFields: [
  customerNumber
];

annotate my_New_ProjectSrv.Products with @UI.HeaderInfo: { TypeName: 'Product', TypeNamePlural: 'Products', Title: { Value: name } };
annotate my_New_ProjectSrv.Products with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate my_New_ProjectSrv.Products with @UI.Identification: [{ Value: name }];
annotate my_New_ProjectSrv.Products with {
  name @title: 'Name';
  description @title: 'Description';
  price @title: 'Price'
};

annotate my_New_ProjectSrv.Products with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price }
];

annotate my_New_ProjectSrv.Products with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: price }
  ]
};

annotate my_New_ProjectSrv.Products with {
  purchases @Common.Label: 'Purchases'
};

annotate my_New_ProjectSrv.Products with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate my_New_ProjectSrv.Products with @UI.SelectionFields: [
  name
];

annotate my_New_ProjectSrv.Purchases with @UI.HeaderInfo: { TypeName: 'Purchase', TypeNamePlural: 'Purchases' };
annotate my_New_ProjectSrv.Purchases with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalPurchaseValue'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRewardPoints'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRedeemedRewardPoints'
      },
    ],
  }
};
annotate my_New_ProjectSrv.Purchases with {
  selectedProduct @Common.ValueList: {
    CollectionPath: 'Products',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: selectedProduct_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'price'
      },
    ],
  }
};
annotate my_New_ProjectSrv.Purchases with {
  purchaseValue @title: 'Purchase Value';
  rewardPoints @title: 'Reward Points'
};

annotate my_New_ProjectSrv.Purchases with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: purchaseValue },
    { $Type: 'UI.DataField', Value: rewardPoints },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID },
    { $Type: 'UI.DataField', Label: 'Selected Product', Value: selectedProduct_ID }
];

annotate my_New_ProjectSrv.Purchases with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: purchaseValue },
    { $Type: 'UI.DataField', Value: rewardPoints },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID },
    { $Type: 'UI.DataField', Label: 'Selected Product', Value: selectedProduct_ID }
  ]
};

annotate my_New_ProjectSrv.Purchases with {
  customer @Common.Text: { $value: customer.customerNumber, ![@UI.TextArrangement]: #TextOnly };
  selectedProduct @Common.Text: { $value: selectedProduct.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate my_New_ProjectSrv.Purchases with {
  customer @Common.Label: 'Customer';
  selectedProduct @Common.Label: 'Selected Product'
};

annotate my_New_ProjectSrv.Purchases with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate my_New_ProjectSrv.Purchases with @UI.SelectionFields: [
  customer_ID,
  selectedProduct_ID
];

annotate my_New_ProjectSrv.Redemptions with @UI.HeaderInfo: { TypeName: 'Redemption', TypeNamePlural: 'Redemptions' };
annotate my_New_ProjectSrv.Redemptions with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalPurchaseValue'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRewardPoints'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRedeemedRewardPoints'
      },
    ],
  }
};
annotate my_New_ProjectSrv.Redemptions with {
  redeemedAmount @title: 'Redeemed Amount'
};

annotate my_New_ProjectSrv.Redemptions with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: redeemedAmount },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
];

annotate my_New_ProjectSrv.Redemptions with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: redeemedAmount },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
  ]
};

annotate my_New_ProjectSrv.Redemptions with {
  customer @Common.Text: { $value: customer.customerNumber, ![@UI.TextArrangement]: #TextOnly }
};

annotate my_New_ProjectSrv.Redemptions with {
  customer @Common.Label: 'Customer'
};

annotate my_New_ProjectSrv.Redemptions with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate my_New_ProjectSrv.Redemptions with @UI.SelectionFields: [
  customer_ID
];
