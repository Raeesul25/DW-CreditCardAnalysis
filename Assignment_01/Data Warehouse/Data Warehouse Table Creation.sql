-- Create DimAccount Table --

CREATE TABLE [dbo].[DimAccount](
	[AccountSK] [int] IDENTITY(1,1) NOT NULL,
	[AlternativeAccountID] [varchar](10) NOT NULL,
	[DistrictSK] [int] NULL,
	[Frequency] [varchar](50) NULL,
	[StartedDate] [date] NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DimAccount] PRIMARY KEY CLUSTERED 
(
	[AccountSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


-- Create DimCard Table --

CREATE TABLE [dbo].[DimCard](
	[CardSK] [int] IDENTITY(1,1) NOT NULL,
	[AlternativeCardID] [varchar](10) NOT NULL,
	[DispositionSK] [int] NULL,
	[CardType] [varchar](25) NULL,
	[IssuedDate] [date] NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DimCard] PRIMARY KEY CLUSTERED 
(
	[CardSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



-- Create DimClient Table --

CREATE TABLE [dbo].[DimClient](
	[ClientSK] [int] IDENTITY(1,1) NOT NULL,
	[AlternativeClientID] [varchar](10) NOT NULL,
	[FirstName] [varchar](30) NULL,
	[LastName] [varchar](30) NULL,
	[DistrictSK] [int] NULL,
	[Gender] [varchar](10) NULL,
	[DateOfBirth] [date] NULL,
	[Age] [int] NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](60) NULL,
	[Address_1] [varchar](60) NULL,
	[Address_2] [varchar](60) NULL,
	[Zipcode] [int] NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_DimClient] PRIMARY KEY CLUSTERED 
(
	[ClientSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


-- Create DimDistrict Table --

CREATE TABLE [dbo].[DimDistrict](
	[DistrictSK] [int] IDENTITY(1,1) NOT NULL,
	[AlternativeDistrictID] [int] NOT NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DimDistrict] PRIMARY KEY CLUSTERED 
(
	[DistrictSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



-- Create DimDisposition Table --

CREATE TABLE [dbo].[DimDisposition](
	[DispositionSK] [int] IDENTITY(1,1) NOT NULL,
	[AlternativeDispositionID] [varchar](10) NOT NULL,
	[AccountSK] [int] NULL,
	[ClientSK] [int] NULL,
	[DispositionType] [varchar](25) NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DimDisposition] PRIMARY KEY CLUSTERED 
(
	[DispositionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



-- Create DimLoan Table --

CREATE TABLE [dbo].[DimLoan](
	[LoanSK] [int] IDENTITY(1,1) NOT NULL,
	[AlternativeLoanID] [varchar](10) NOT NULL,
	[AccountSK] [int] NULL,
	[DistrictSK] [int] NULL,
	[Amount] [numeric](18, 2) NULL,
	[Duration] [int] NULL,
	[Payments] [numeric](18, 2) NULL,
	[Status] [varchar](5) NULL,
	[Loan_date] [date] NULL,
	[Purpose] [varchar](50) NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DimLoan] PRIMARY KEY CLUSTERED 
(
	[LoanSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]




-- Create DimPermanentOrder Table --

CREATE TABLE [dbo].[DimPermanentOrder](
	[OrderSK] [int] IDENTITY(1,1) NOT NULL,
	[AlternativeOrderID] [int] NOT NULL,
	[AccountSK] [int] NULL,
	[Bank_to] [varchar](10) NULL,
	[Account_to] [int] NULL,
	[Amount] [numeric](18, 2) NULL,
	[OrderType] [varchar](100) NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DimPermanentOrder] PRIMARY KEY CLUSTERED 
(
	[OrderSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



-- Create FactTransaction Table --

CREATE TABLE [dbo].[FactTransaction](
	[TransactionID] [varchar](10) NOT NULL,
	[AccounSK] [int] NULL,
	[ClientSK] [int] NULL,
	[LoanSK] [int] NULL,
	[OrderSK] [int] NULL,
	[DispositionSK] [int] NULL,
	[DateSK] [int] NULL,
	[Type] [varchar](25) NULL,
	[Operation] [varchar](50) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Balance] [decimal](18, 2) NULL,
	[InsertDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL
) ON [PRIMARY]