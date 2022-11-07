CREATE DATABASE salesdw;
CREATE TABLE DimDate(
	DateKey int NOT NULL,
	FullDateAlternateKey date NOT NULL,
	DayNumberOfWeek Smallint NOT NULL,
	EnglishDayNameOfWeek Varchar(10) NOT NULL,
	SpanishDayNameOfWeek Varchar(10) NOT NULL,
	FrenchDayNameOfWeek Varchar(10) NOT NULL,
	DayNumberOfMonth Smallint NOT NULL,
	DayNumberOfYear smallint NOT NULL,
	WeekNumberOfYear Smallint NOT NULL,
	EnglishMonthName Varchar(10) NOT NULL,
	SpanishMonthName Varchar(10) NOT NULL,
	FrenchMonthName Varchar(10) NOT NULL,
	MonthNumberOfYear Smallint NOT NULL,
	CalendarQuarter Smallint NOT NULL,
	CalendarYear smallint NOT NULL,
	CalendarSemester Smallint NOT NULL,
	FiscalQuarter Smallint NOT NULL,
	FiscalYear smallint NOT NULL,
	FiscalSemester Smallint NOT NULL
);

CREATE TABLE DimCurrency(
	CurrencyKey int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	CurrencyAlternateKey Char(3) NOT NULL,
	CurrencyName Varchar(50) NOT NULL
);

CREATE TABLE DimCustomer(
	CustomerKey int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	GeographyKey int NULL,
	CustomerAlternateKey Varchar(15) NOT NULL,
	Title Varchar(8) NULL,
	FirstName Varchar(50) NULL,
	MiddleName Varchar(50) NULL,
	LastName Varchar(50) NULL,
	NameStyle Boolean NULL,
	BirthDate date NULL,
	MaritalStatus Char(1) NULL,
	Suffix Varchar(10) NULL,
	Gender Varchar(1) NULL,
	EmailAddress Varchar(50) NULL,
	YearlyIncome money NULL,
	TotalChildren Smallint NULL,
	NumberChildrenAtHome Smallint NULL,
	EnglishEducation Varchar(40) NULL,
	SpanishEducation Varchar(40) NULL,
	FrenchEducation Varchar(40) NULL,
	EnglishOccupation Varchar(100) NULL,
	SpanishOccupation Varchar(100) NULL,
	FrenchOccupation Varchar(100) NULL,
	HouseOwnerFlag Char(1) NULL,
	NumberCarsOwned Smallint NULL,
	AddressLine1 Varchar(120) NULL,
	AddressLine2 Varchar(120) NULL,
	Phone Varchar(20) NULL,
	DateFirstPurchase date NULL,
	CommuteDistance Varchar(15) NULL
);

CREATE TABLE DimGeography(
	GeographyKey int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	City Varchar(30) NULL,
	StateProvinceCode Varchar(3) NULL,
	StateProvinceName Varchar(50) NULL,
	CountryRegionCode Varchar(3) NULL,
	EnglishCountryRegionName Varchar(50) NULL,
	SpanishCountryRegionName Varchar(50) NULL,
	FrenchCountryRegionName Varchar(50) NULL,
	PostalCode Varchar(15) NULL,
	SalesTerritoryKey int NULL,
	IpAddressLocator Varchar(15) NULL
);

CREATE TABLE DimProduct(
	ProductKey int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	ProductAlternateKey Varchar(25) NULL,
	ProductSubcategoryKey int NULL,
	WeightUnitMeasureCode Char(3) NULL,
	SizeUnitMeasureCode Char(3) NULL,
	EnglishProductName Varchar(50) NOT NULL,
	SpanishProductName Varchar(50) NOT NULL,
	FrenchProductName Varchar(50) NOT NULL,
	StandardCost money NULL,
	FinishedGoodsFlag Boolean NOT NULL,
	Color Varchar(15) NOT NULL,
	SafetyStockLevel smallint NULL,
	ReorderPoint smallint NULL,
	ListPrice money NULL,
	Size Varchar(50) NULL,
	SizeRange Varchar(50) NULL,
	Weight Double precision NULL,
	DaysToManufacture int NULL,
	ProductLine Char(2) NULL,
	DealerPrice money NULL,
	Class Char(2) NULL,
	Style Char(2) NULL,
	ModelName Varchar(50) NULL,
	LargePhoto Bytea NULL,
	EnglishDescription Varchar(400) NULL,
	FrenchDescription Varchar(400) NULL,
	ChineseDescription Varchar(400) NULL,
	ArabicDescription Varchar(400) NULL,
	HebrewDescription Varchar(400) NULL,
	ThaiDescription Varchar(400) NULL,
	GermanDescription Varchar(400) NULL,
	JapaneseDescription Varchar(400) NULL,
	TurkishDescription Varchar(400) NULL,
	StartDate Timestamp(3) NULL,
	EndDate Timestamp(3) NULL,
	Status Varchar(7) NULL
);

CREATE TABLE DimProductCategory(
	ProductCategoryKey int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	ProductCategoryAlternateKey int NULL,
	EnglishProductCategoryName Varchar(50) NOT NULL,
	SpanishProductCategoryName Varchar(50) NOT NULL,
	FrenchProductCategoryName Varchar(50) NOT NULL
);

CREATE TABLE DimProductSubcategory(
	ProductSubcategoryKey int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	ProductSubcategoryAlternateKey int NULL,
	EnglishProductSubcategoryName Varchar(50) NOT NULL,
	SpanishProductSubcategoryName Varchar(50) NOT NULL,
	FrenchProductSubcategoryName Varchar(50) NOT NULL,
	ProductCategoryKey int NULL
);

CREATE TABLE DimPromotion(
	PromotionKey int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	PromotionAlternateKey int NULL,
	EnglishPromotionName Varchar(255) NULL,
	SpanishPromotionName Varchar(255) NULL,
	FrenchPromotionName Varchar(255) NULL,
	DiscountPct Double precision NULL,
	EnglishPromotionType Varchar(50) NULL,
	SpanishPromotionType Varchar(50) NULL,
	FrenchPromotionType Varchar(50) NULL,
	EnglishPromotionCategory Varchar(50) NULL,
	SpanishPromotionCategory Varchar(50) NULL,
	FrenchPromotionCategory Varchar(50) NULL,
	StartDate Timestamp(3) NOT NULL,
	EndDate Timestamp(3) NULL,
	MinQty int NULL,
	MaxQty int NULL
);


CREATE TABLE DimSalesTerritory(
	SalesTerritoryKey int GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1) NOT NULL,
	SalesTerritoryAlternateKey int NULL,
	SalesTerritoryRegion Varchar(50) NOT NULL,
	SalesTerritoryCountry Varchar(50) NOT NULL,
	SalesTerritoryGroup Varchar(50) NULL,
	SalesTerritoryImage Bytea NULL
);

CREATE TABLE FactInternetSales(
	ProductKey int NOT NULL,
	OrderDateKey int NOT NULL,
	DueDateKey int NOT NULL,
	ShipDateKey int NOT NULL,
	CustomerKey int NOT NULL,
	PromotionKey int NOT NULL,
	CurrencyKey int NOT NULL,
	SalesTerritoryKey int NOT NULL,
	SalesOrderNumber Varchar(20) NOT NULL,
	SalesOrderLineNumber Smallint NOT NULL,
	RevisionNumber Smallint NOT NULL,
	OrderQuantity smallint NOT NULL,
	UnitPrice money NOT NULL,
	ExtendedAmount money NOT NULL,
	UnitPriceDiscountPct Double precision NOT NULL,
	DiscountAmount Double precision NOT NULL,
	ProductStandardCost money NOT NULL,
	TotalProductCost money NOT NULL,
	SalesAmount money NOT NULL,
	TaxAmt money NOT NULL,
	Freight money NOT NULL,
	CarrierTrackingNumber Varchar(25) NULL,
	CustomerPONumber Varchar(25) NULL,
	OrderDate Timestamp(3) NULL,
	DueDate Timestamp(3) NULL,
	ShipDate Timestamp(3) NULL
);

CREATE TABLE FactInternetSalesReason(
	SalesOrderNumber Varchar(20) NOT NULL,
	SalesOrderLineNumber Smallint NOT NULL,
	SalesReasonKey int NOT NULL
);

ALTER TABLE DimCurrency ADD PRIMARY KEY (CurrencyKey);
ALTER TABLE DimCustomer ADD PRIMARY KEY (CustomerKey);
ALTER TABLE DimDate ADD PRIMARY KEY (DateKey);
ALTER TABLE DimGeography ADD PRIMARY KEY (GeographyKey);
ALTER TABLE DimProduct ADD PRIMARY KEY (ProductKey);
ALTER TABLE DimProductCategory ADD PRIMARY KEY (ProductCategoryKey);
ALTER TABLE DimProductSubcategory ADD PRIMARY KEY (ProductSubcategoryKey);
ALTER TABLE DimPromotion ADD PRIMARY KEY (PromotionKey);
ALTER TABLE DimSalesTerritory ADD PRIMARY KEY (SalesTerritoryKey);
ALTER TABLE FactInternetSales ADD PRIMARY KEY (SalesOrderNumber,SalesOrderLineNumber);
ALTER TABLE FactInternetSalesReason ADD PRIMARY KEY (SalesOrderNumber,SalesOrderLineNumber,SalesReasonKey);


CREATE UNIQUE INDEX AK_DimCurrency_CurrencyAlternateKey ON DimCurrency(CurrencyAlternateKey);
CREATE UNIQUE INDEX IX_DimCustomer_CustomerAlternateKey ON DimCustomer(CustomerAlternateKey);
CREATE UNIQUE INDEX AK_DimDate_FullDateAlternateKey ON DimDate(FullDateAlternateKey);

ALTER TABLE DimProduct ADD  CONSTRAINT AK_DimProduct_ProductAlternateKey_StartDate UNIQUE 
(
	ProductAlternateKey,
	StartDate 
);

ALTER TABLE DimProductCategory ADD  CONSTRAINT AK_DimProductCategory_ProductCategoryAlternateKey UNIQUE 
(
	ProductCategoryAlternateKey 
);


ALTER TABLE DimProductSubcategory ADD  CONSTRAINT AK_DimProductSubcategory_ProductSubcategoryAlternateKey UNIQUE 
(
	ProductSubcategoryAlternateKey 
);
 
ALTER TABLE DimPromotion ADD  CONSTRAINT AK_DimPromotion_PromotionAlternateKey UNIQUE 
(
	PromotionAlternateKey 
) ;

ALTER TABLE DimSalesTerritory ADD  CONSTRAINT AK_DimSalesTerritory_SalesTerritoryAlternateKey UNIQUE 
(
	SalesTerritoryAlternateKey 
) ;

ALTER TABLE DimCustomer ADD
	CONSTRAINT FK_DimCustomer_DimGeography FOREIGN KEY
	(
		GeographyKey
	)
	REFERENCES DimGeography (GeographyKey);

ALTER TABLE DimGeography ADD
    CONSTRAINT FK_DimGeography_DimSalesTerritory  FOREIGN KEY 
    (
        SalesTerritoryKey
    ) REFERENCES DimSalesTerritory (SalesTerritoryKey);
   
ALTER TABLE DimProduct ADD 
    CONSTRAINT FK_DimProduct_DimProductSubcategory FOREIGN KEY 
    (
        ProductSubcategoryKey
    ) REFERENCES DimProductSubcategory (ProductSubcategoryKey); 
   
ALTER TABLE DimProductSubcategory ADD 
    CONSTRAINT FK_DimProductSubcategory_DimProductCategory FOREIGN KEY 
    (
        ProductCategoryKey
    ) REFERENCES DimProductCategory (ProductCategoryKey);   
 
ALTER TABLE FactInternetSales ADD 
CONSTRAINT FK_FactInternetSales_DimCurrency FOREIGN KEY 
    (
        CurrencyKey
    ) REFERENCES DimCurrency (CurrencyKey);
ALTER TABLE FactInternetSales ADD 
CONSTRAINT FK_FactInternetSales_DimCustomer FOREIGN KEY 
    (
        CustomerKey
    ) REFERENCES DimCustomer (CustomerKey);
ALTER TABLE FactInternetSales ADD 
CONSTRAINT FK_FactInternetSales_DimDate FOREIGN KEY 
    (
        OrderDateKey
    ) REFERENCES DimDate (DateKey);
ALTER TABLE FactInternetSales ADD 
CONSTRAINT FK_FactInternetSales_DimDate1 FOREIGN KEY 
    (
        DueDateKey
    ) REFERENCES DimDate (DateKey);
ALTER TABLE FactInternetSales ADD 
CONSTRAINT FK_FactInternetSales_DimDate2 FOREIGN KEY 
    (
        ShipDateKey
    ) REFERENCES DimDate (DateKey);
ALTER TABLE FactInternetSales ADD 
CONSTRAINT FK_FactInternetSales_DimProduct FOREIGN KEY 
    (
        ProductKey
    ) REFERENCES DimProduct (ProductKey);
ALTER TABLE FactInternetSales ADD 
CONSTRAINT FK_FactInternetSales_DimPromotion FOREIGN KEY 
    (
        PromotionKey
    ) REFERENCES DimPromotion (PromotionKey);
ALTER TABLE FactInternetSales ADD 
CONSTRAINT FK_FactInternetSales_DimSalesTerritory FOREIGN KEY 
    (
        SalesTerritoryKey
    ) REFERENCES DimSalesTerritory (SalesTerritoryKey);
   
ALTER TABLE FactInternetSalesReason ADD 
    CONSTRAINT FK_FactInternetSalesReason_FactInternetSales FOREIGN KEY 
    (
        SalesOrderNumber, SalesOrderLineNumber
    ) REFERENCES FactInternetSales (SalesOrderNumber, SalesOrderLineNumber);
   
CREATE VIEW vall
AS
    SELECT
        pc.EnglishProductCategoryName
        ,Coalesce(p.ModelName, p.EnglishProductName) AS Model
        ,c.CustomerKey
        ,s.SalesTerritoryGroup AS Region
        ,CASE
            WHEN EXTRACT(MONTH FROM NOW()) < EXTRACT(MONTH FROM c.BirthDate)
                THEN DATE_PART('year', NOW()) - DATE_PART('year', c.BirthDate) - 1 
            WHEN EXTRACT(MONTH FROM NOW()) = EXTRACT(MONTH FROM c.BirthDate)
            AND EXTRACT(DAY FROM NOW()) < EXTRACT(DAY FROM c.BirthDate)
                THEN DATE_PART('year', NOW()) - DATE_PART('year', c.BirthDate) - 1 
            ELSE DATE_PART('year', NOW()) - DATE_PART('year', c.BirthDate) 
        END AS Age
        ,CASE
            WHEN c.YearlyIncome::numeric::int < 40000 THEN 'Low'
            WHEN c.YearlyIncome::numeric::int > 60000 THEN 'High'
            ELSE 'Moderate'
        END AS IncomeGroup
        ,d.CalendarYear
        ,d.FiscalYear
        ,d.MonthNumberOfYear AS Month
        ,f.SalesOrderNumber AS OrderNumber
        ,f.SalesOrderLineNumber AS LineNumber
        ,f.OrderQuantity AS Quantity
        ,f.ExtendedAmount AS Amount  
    FROM
        FactInternetSales f
    INNER JOIN DimDate d
        ON f.OrderDateKey = d.DateKey
    INNER JOIN DimProduct p
        ON f.ProductKey = p.ProductKey
    INNER JOIN DimProductSubcategory psc
        ON p.ProductSubcategoryKey = psc.ProductSubcategoryKey
    INNER JOIN DimProductCategory pc
        ON psc.ProductCategoryKey = pc.ProductCategoryKey
    INNER JOIN DimCustomer c
        ON f.CustomerKey = c.CustomerKey
    INNER JOIN DimGeography g
        ON c.GeographyKey = g.GeographyKey
    INNER JOIN DimSalesTerritory s
        ON g.SalesTerritoryKey = s.SalesTerritoryKey 
;
   
SELECT * FROM vall;
   
   
   
   
   
   
   
   
   
   
   
   
