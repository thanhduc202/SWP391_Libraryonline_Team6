use [master]
go
/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'SWP')
BEGIN
	ALTER DATABASE [SWP] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [SWP] SET ONLINE;
	DROP DATABASE [SWP];
END
GO

CREATE DATABASE [SWP]
GO

USE [SWP]
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 
GO

CREATE TABLE [dbo].[Account](
	[AccountName] [nvarchar](80) NOT NULL,
	[AccountPassword] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[PhoneNumber] [bigint] NULL,
	[Status] [int] NULL,
	[AccessLevel] [int] NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[AccountName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 20/02/2023 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Bname] [nvarchar](50) NULL,
	[Author] [nvarchar](80) NULL,
	[image] nvarchar(300) NULL,
	[Cid] [int] NULL,
	[Language] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[quantity] [int] NULL,
	[publisher] [nvarchar](75) NULL,
	[publishYear] [int] NULL,
	[pages] [int] NULL,
 CONSTRAINT [PK__Book__3DE0C22789A1516C] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Category]    Script Date: 20/02/2023 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CID] [int] NOT NULL,
	[CName] [nvarchar](50) NULL,
	[Major] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 20/02/2023 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[StudentID] [nvarchar](50) NOT NULL,
	[BookID] [int] NOT NULL,
	[Content] [nvarchar](200) NULL,
	[Star] [int] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Librarian]    Script Date: 20/02/2023 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Librarian](
	[LibrarianID] [nvarchar](50) NOT NULL,
	[AccountName] [nvarchar](80) NULL,
	[Shift] [nvarchar](50) NULL,
	[Note] [nvarchar](50) NULL,
 CONSTRAINT [PK_Librarian_1] PRIMARY KEY CLUSTERED 
(
	[LibrarianID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListOrderBooks]    Script Date: 20/02/2023 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Student]    Script Date: 20/02/2023 15:51:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [nvarchar](50) NOT NULL,
	[AccountName] [nvarchar](80) NULL,
	[Semsester] [int] NULL,
	[Major] [nvarchar](50) NULL,
	[note] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Method] (
	MethodID INT IDENTITY(1,1),
	MethodName nvarchar(150) NOT NULL,
	PRIMARY KEY(MethodID)
)


CREATE TABLE Announcement(
	AnnouncementID INT IDENTITY(1,1),
	[LibrarianID] [nvarchar](50) NOT NULL,
	[PublishDate] DATE DEFAULT GETDATE(),
	[Title] Nvarchar(255),
	[Note] NVARCHAR(max),
	PRIMARY KEY(AnnouncementID),
	FOREIGN KEY([LibrarianID]) REFERENCES Librarian([LibrarianID])
)

CREATE TABLE [dbo].[Status] (
	StatusID int identity(1,1) primary key,
	statusName nvarchar(255)
)

CREATE TABLE [dbo].[Order] (
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [nvarchar](80) NOT NULL,
	[MethodID] [int],
	[LibrarianID] [nvarchar](50) DEFAULT NULL,
	[OrderDate] DATE DEFAULT GETDATE(),
	[ScheduledTime] DATE,
	[StatusID] int DEFAULT 1,
	PRIMARY KEY ([OrderID]),
	FOREIGN KEY([StatusID]) REFERENCES Status([StatusID]),
	FOREIGN KEY(AccountName) REFERENCES Account([AccountName]),
	FOREIGN KEY([MethodID]) REFERENCES Method(MethodID),
	FOREIGN KEY(LibrarianID) REFERENCES Librarian(LibrarianID)
)
GO


CREATE TABLE [dbo].[OrderDetails] (
	[OrderDetailID] int IDENTITY(1,1),
	[OrderID] int NOT NULL,
	[BookID] int NOT NULL,
	[ReceivedOn] NVARCHAR(255),
	[ReturnOn] Date,
	PRIMARY KEY([OrderDetailID]),
	FOREIGN KEY([OrderID]) REFERENCES [Order](OrderID),
	FOREIGN KEY([BookID]) REFERENCES Book([BookID])
)


CREATE TABLE [dbo].[Penalty] (
	PenaltyID INT IDENTITY(1,1),
	[AccountName] [nvarchar](80),
	OrderID INT,
	Amount MONEY,
	[StatusID] int DEFAULT 7,
	PRIMARY KEY(PenaltyID),
	FOREIGN KEY([AccountName]) REFERENCES Account([AccountName]),
	FOREIGN KEY([StatusID]) REFERENCES Status([StatusID]),
	FOREIGN KEY(OrderID) REFERENCES [Order](OrderID)
)


CREATE TABLE [dbo].[Renewal](
	RenewalID INT IDENTITY(1,1),
	[OrderID] int,
	[LibrarianID] [nvarchar](50) DEFAULT NULL,
	[ExtendDate] DATE,
	[Reason] NVARCHAR(max),
	[StatusID] INT,
	PRIMARY KEY(RenewalID),
	FOREIGN KEY([StatusID]) REFERENCES Status([StatusID]),
	FOREIGN KEY([OrderID]) REFERENCES [Order]([OrderID]),
	FOREIGN KEY(LibrarianID) REFERENCES Librarian(LibrarianID)
)


INSERT INTO [dbo].[Method]
           ([MethodName])
     VALUES
           ('Direct'), ('Delivery')


INSERT INTO [dbo].[Status]
           ([statusName])
     VALUES
           ('Pending'), ('Approved'), ('Closed'), ('Overdue'), ('Received'), ('Paid'), ('Unpaid')


INSERT [dbo].[Account] ([AccountName], [AccountPassword], [FullName], [Gender], [PhoneNumber], [Status], [AccessLevel]) VALUES (N'chung@gmail.com', N'123', N'do van chung', 1, 123123123, 1, 1)
INSERT [dbo].[Account] ([AccountName], [AccountPassword], [FullName], [Gender], [PhoneNumber], [Status], [AccessLevel]) VALUES (N'hoang@gmail.com', N'123', N'hoang', 1, 123123123, 1, 2)
INSERT [dbo].[Account] ([AccountName], [AccountPassword], [FullName], [Gender], [PhoneNumber], [Status], [AccessLevel]) VALUES (N'linh@gmail.com', N'123', N'linh', 0, 123123123, 1, 1)
INSERT [dbo].[Account] ([AccountName], [AccountPassword], [FullName], [Gender], [PhoneNumber], [Status], [AccessLevel]) VALUES (N'long@gmail.com', N'123', N'long', 1, 9243645, 1, 1)
INSERT [dbo].[Account] ([AccountName], [AccountPassword], [FullName], [Gender], [PhoneNumber], [Status], [AccessLevel]) VALUES (N'nam@gmail.com', N'123', N'nam', 1, 9576846, 1, 1)
GO

SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (1, N'Lazy diary', N'joe burn', N'img/Lazy diary.jpg', 1, N'English', N'the dramitic stoy about a child', 1, 19, N'open book', 2020, 200)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (2, N'firebase', N'adam rotch', N'img', 2, N'other', N'aaa', 2, 2, N'bod', 2020, 200)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (3, N'Software Engineering at Google: Lessons Learned', N'Titus Winters
', N'img/Software Engineering at Google.jpg', 1, N'English', N'Today, software engineers need to know not only how to program effectively but also how to develop proper engineering practices to make their codebase sustainable AND healthy. This book emphasizes this difference BETWEEN programming AND software engineering. How can software engineers manage a living codebase that evolves AND responds to changing requirements AND demands over the length of its life? Based ON their experience at Google, software engineers Titus Winters AND Hyrum Wright, along WITH technical writer Tom Manshreck, present a candid AND insightful look at how some of the world’s leading practitioners construct AND maintain software. This book covers Google’s unique engineering culture, processes, AND tools AND how these aspects contribute to the effectiveness of an engineering organization.', 3, 50, N'O′Reilly', 2020, 300)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (4, N'Fundamentals of Software Architecture', N'Neal Ford, 
Mark Richards', N'img/Fundamentals of Software Architecture.jpg', 1, N'English', N'Salary surveys worldwide regularly place software architect IN the top 10 best jobs, yet no real guide exists to help developers become architects. Until now. This book provides the first comprehensive overview of software architecture’s many aspects. Aspiring AND existing architects alike will examine architectural characteristics, architectural patterns, component determination, diagramming AND presenting architecture, evolutionary architecture, AND many other topics.', 0, 70, N'O''Reilly ', 2020, 300)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (5, N'Python Crash Course, 2nd Edition', N'Eric Matthes', N'img/Python Crash Course, 2nd Edition.jpg', 1, N'English', N'Python Crash Course is the world''''s best-selling guide to the Python programming language. This fast-paced, thorough introduction to programming WITH Python will have you writing programs, solving problems, AND making things that work IN no time.', 1, 20, N' No Starch Press', 2019, 450)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (6, N'Blockchain Bubble or Revolution', N'Neel Mehta, 
Aditya Agashe', N'img/Blockchain Bubble or Revolution.jpg', 1, N'English', N'Authored by Silicon Valley leaders FROM Google, Microsoft, AND Facebook, Bubble or Revolution cuts through the hype to offer a balanced, comprehensive, AND accessible analysis of blockchains AND cryptocurrencies.', NULL, 50, N'Paravane Ventures', 2019, 310)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (7, N'Expert Python Programming: Master Python', N'Michal Jaworski, Tarek Ziadé', N'img/Expert Python Programming.jpg', 1, N'English', N'The book will start by taking you through the new features IN Python 3.7. You''''ll THEN learn the advanced components of Python syntax, IN addition to understanding how to apply concepts of various programming paradigms, including object-oriented programming, functional programming, AND event-driven programming. This book will also guide you through learning the best naming practices, writing your own distributable Python packages, AND getting up to speed WITH automated ways of deploying your software ON remote servers. You''''ll discover how to CREATE useful Python extensions WITH C, C++, Cython, AND CFFI. Furthermore, studying about code management tools, writing clear documentation, AND exploring test-driven development will help you write clean code.', NULL, 50, N'Packt Publishing', 2021, 400)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (8, N'DEKIRU NIHONGO BEGINNER1', N'Kazukoshimada', N'img/dekiru-nihongo-1-beginner-s-level-main-textbook.jpg', 1, N'English', N'Dekiru Nihongo Beginner focuses on practicing and building vocabulary through examples based on everyday life. The goal is to build your Japanese skills so they can be used in real life situations. Each chapter introduces a topic with an illustrated situation. The illustrations guide you on how to form  sentences to match the situation shown. The ideal response is then presented with further challenges to change the information. such as a new date or location to ask for. Listening exercises are also available lei each topic on the included 3 CDs along with word lists for eacn chapter.', NULL, 50, N' BONJINSHA', 2020, 300)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (9, N'The Road to React: Your Journey to Master', N'
Robin Wieruch', N'img/The Road to React.png', 1, N'English', N'In "The Road to React" you will learn about all the fundamentals of React.js WITH Hooks while building a full-blown React application step by step. While you CREATE the React application, every chapter will introduce you to a new React key feature. However, there is more than only the fundamentals: The book dives into related topics (e.g. React WITH TypeScript, Testing, Performance Optimizations) AND advanced feature implementations like client- AND server-side searching. At the end of the book, you will have a fully working deployed React application.Is it up to date?Programming books are usually outdated soon after their release, but since this book is self- published, I can update it AS needed whenever a new version of something related to this book gets released.I am a beginner. Is this book for me?Yes. The book starts FROM zero AND takes you through the learning experience step by step. Every chapter builds up ON the learnings FROM the previous chapter. IN addition, at the end of every chapter, exercises fortify your lessons learned. If you got stuck IN a chapter, you will always find a reference URL to the status quo of the actual code.', NULL, 50, N'Independently published', 2020, 260)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (10, N'JavaScript AND JQuery', N'Jon Duckett,Jack Moore', N'img/JavaScript AND JQuery.jpg', 1, N'English', N'By the end of the book, not only will you be able to use the thousands of scripts, JavaScript APIs, AND jQuery plugins that are freely available ON the web, AND be able to customize them - you will also be able to CREATE your own scripts FROM scratch.', NULL, 50, N'Wiley', 2020, 350)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (11, N'PHP & MySQL: Server-side Web Development', N'Jon Duckett', N'img/PHP & MySQL.jpg', 1, N'English', N'This full-color book is packed WITH inspiring code examples, infographics AND photography that not only teach you the PHP language AND how to work WITH databases, but also show you how to build new applications FROM scratch.', NULL, 50, N'Wiley', 2020, 400)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (12, N'Mobile Development WITH .NET', N'Kwimbee', N'img/Mobile Development WITH .NET.jpg', 1, N'English', N'Quisque ligula lorem, dictum vitae ante in, pretium finibus ante. Sed sem mauris, convallis eget lectus non, vestibulum pharetra felis. Vivamus a metus neque. Duis sed est lorem. Duis imperdiet eu nisl vulputate scelerisque. Donec ut ligula neque. Proin nunc augue, pharetra quis vulputate quis, finibus a orci. Sed rutrum dapibus mattis. ', NULL, 50, N'Kwimbee', 2020, 200)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (13, N'Computer Organization And
Architecture', N'
William Stallings', N'img/Computer Organization And.jpg', 1, N'English', N'Four-time winner of the best Computer Science and Engineering textbook of the year award from the Textbook and Academic Authors Association, Computer Organization and Architecture: Designing for Performance provides a thorough discussion of the fundamentals of computer organization and architecture, covering not just processor design, but memory, I/O and parallel systems. Coverage is supported by a wealth of concrete examples emphasizing modern systems.', NULL, 50, N'Pearson', 2009, 200)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (14, N'Foundations of Programming', N'Michael R. Garey, John C. Mitchell, Albert Meyer', N'img/Foundations of Programming.jpg', 1, N'English', N'Written for advanced undergraduate and beginning graduate students, Foundations for Programming Languages uses a series of typed lambda calculi to study the axiomatic, operational, and denotational semantics of sequential programming languages. Later chapters are devoted to progressively more sophisticated type systems. Compared to other texts on the subject, Foundations for Programming Languages is distinguished primarily by its inclusion of material on universal algebra and algebraic data types, imperative languages and Floyd-Hoare logic, and advanced chapters on polymorphism and modules, subtyping and object-oriented concepts, and type inference. The book is mathematically oriented but includes discussion, motivation, and examples that make the material accessible to students specializing in software systems, theoretical computer science, or mathematical logic. Foundations for Programming Languages is suitable as a reference for professionals concerned with programming languages, software validation or verification, and programming, including those working with software modules or object-oriented programming.Foundations of Computing series', NULL, 50, N'The MIT Press', 1996, 250)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (15, N'Learning Web Design', N'Jennifer Niederst Robbins', N'img/Learning Web Design.jpg', 1, N'English', N'Do you want to build web pages but have no prior experience? This friendly guide is the perfect place to start. You’ll begin at square one, learning how the web and web pages work, and then steadily build from there. By the end of the book, you’ll have the skills to create a simple site with multicolumn pages that adapt for mobile devices.', NULL, 50, N'O''Reilly', 2018, 350)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (16, N'Learn C Programming', N'Jeff Szuhay', N'img/Learn C Programming.jpg', 1, N'English', N'The book takes you through basic programming concepts and shows you how to implement them in the C programming language. Throughout the book, you''ll create and run programs that demonstrate essential C concepts, such as program structure with functions, control structures such as loops and conditional statements, and complex data structures. As you make progress, you''ll get to grips with in-code documentation, testing, and validation methods. This new edition expands upon the use of enumerations, arrays, and additional C features, and provides two working programs based on the code used in the book. What''s more, this book uses the method of intentional failure, where you''ll develop a working program and then purposely break it to see what happens, thereby learning how to recognize possible mistakes when they happen.', NULL, 50, N'Packt Publishing', 2022, 300)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (17, N'I Love You to the Moon and Back', N'Amelia Hepworth', N'img/I Love You to the Moon and Back.jpg', 2, N'English', N'When the sun comes up, Big Bear and Little Bear think of new ways to share their love. Big Bear loves Little Bear more and more as each day passes, right up to each new moon – and back.    A joyful celebration of the love between parent and child, this lovely chunky board book is perfect for reading with your special little person. With sturdy pages that are easy for little hands to turn and beautiful illustrations by Tim Warnes, I Love You to the Moon and Back will soon become a firm bedtime favourite.', NULL, 50, N'Tiger Tales', 2015, 200)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (18, N'Goodnight Moon', N'Margaret Wise Brown', N'img/Goodnight Moon.jpg', 2, N'English', N'In a great green room, tucked away in bed, is a little bunny. "Goodnight room, goodnight moon." And to all the familiar things in the softly lit room—to the picture of the three little bears sitting on chairs, to the clocks and his socks, to the mittens and the kittens, to everything one by one—the little bunny says goodnight.', NULL, 50, N'HarperFestival', 2007, 200)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (19, N'Software Architecture', N'
Mark Richards, Neal Ford', N'img/Software Architecture.jpg', 1, N'English', N'Architecture veterans and practicing consultants Neal Ford, Mark Richards, Pramod Sadalage, and Zhamak Dehghani discuss strategies for choosing an appropriate architecture. By interweaving a story about a fictional group of technology professionals--the Sysops Squad--they examine everything from how to determine service granularity, manage workflows and orchestration, manage and decouple contracts, and manage distributed transactions to how to optimize operational characteristics, such as scalability, elasticity, and performance.', NULL, 50, N'O''Reilly', 2021, 350)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (20, N'Clean Code: A Handbook of Agile Software', N'
Dean Wampler, 
Robert C. Martin', N'img/Clean Code.jpg', 1, N'English', N'Noted software expert Robert C. Martin, presents a revolutionary paradigm with Clean Code: A Handbook of Agile Software Craftsmanship. Martin, who has helped bring agile principles from a practitioner’s point of view to tens of thousands of programmers, has teamed up with his colleagues from Object Mentor to distill their best agile practice of cleaning code “on the fly” into a book that will instill within you the values of software craftsman, and make you a better programmer―but only if you work at it.', NULL, 50, N'Pearson', 2008, 300)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (21, N'ASP.NET Core in Action', N'Andrew Lock
', N'img/ASP.NET Core in Action.jpg', NULL, N'English', N'ASP.NET Core in Action opens up the world of cross-platform web development with .NET. You''ll start with a crash course in .NET Core, immediately cutting the cord between ASP.NET and Windows. Then, you''ll begin to build amazing web applications step by step, systematically adding essential features like logins, configuration, dependency injection, and custom components. Along the way, you''ll mix in important process steps like testing, multiplatform deployment, and security.', NULL, 50, N'Manning', 2018, 300)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO

INSERT [dbo].[Category] ([CID], [CName], [Major]) VALUES (1, N'classic', NULL)
INSERT [dbo].[Category] ([CID], [CName], [Major]) VALUES (2, N'lifeStyle', NULL)
INSERT [dbo].[Category] ([CID], [CName], [Major]) VALUES (3, N'Trader', NULL)
GO
INSERT [dbo].[Librarian] ([LibrarianID], [AccountName], [Shift], [Note]) VALUES (N'L111', N'hoang@gmail.com', N'1', NULL)
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [AccountName], [MethodID], [LibrarianID], [OrderDate], [ScheduledTime]) VALUES (1, N'nam@gmail.com', 1, N'L111', CAST(N'2023-02-23' AS Date), '2023-11-11')
INSERT [dbo].[Order] ([OrderID], [AccountName], [MethodID], [LibrarianID], [OrderDate], [ScheduledTime]) VALUES (2, N'long@gmail.com', 2, N'L111', CAST(N'2023-02-23' AS Date), GETDATE())
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [BookID], [ReceivedOn], [ReturnOn]) VALUES (5, 1, 1, NULL, NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [BookID], [ReceivedOn], [ReturnOn]) VALUES (6, 2, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Penalty] ON 

INSERT [dbo].[Penalty] ([PenaltyID],[AccountName], [OrderID], [Amount]) VALUES (1,N'nam@gmail.com', 2, 20.0000)
INSERT [dbo].[Penalty] ([PenaltyID],[AccountName], [OrderID], [Amount]) VALUES (2,N'long@gmail.com', 1, 20.0000)
SET IDENTITY_INSERT [dbo].[Penalty] OFF
GO
SET IDENTITY_INSERT [dbo].[Renewal] ON 

INSERT [dbo].[Renewal] ([RenewalID], [OrderID], [LibrarianID], [ExtendDate], [Reason], [StatusID]) VALUES (8, 1, N'L111', CAST(N'2023-02-27' AS Date), N'sdfghdhfghfđfg', 1)
INSERT [dbo].[Renewal] ([RenewalID], [OrderID], [LibrarianID], [ExtendDate], [Reason], [StatusID]) VALUES (9, 2, N'L111', CAST(N'2023-04-30' AS Date), N'dfghdfghdfg', 2)
SET IDENTITY_INSERT [dbo].[Renewal] OFF
GO


INSERT INTO [dbo].[Announcement]
           ([LibrarianID]
           ,[Title]
           ,[Note])
     VALUES
           ('L111', 'test1', 'test1'),
		   ('L111', 'test2', 'test2'),
		   ('L111', 'test3', 'test3')


INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he11', N'chung@gmail.com', 1, N'1', NULL)
INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he12', N'linh@gmail.com', 2, N'1', NULL)
INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he13', N'nam@gmail.com', 1, N'1', NULL)
INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he14', N'long@gmail.com', 1, N'1', NULL)
INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he15', NULL, 1, N'1', NULL)
INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he16', NULL, 1, N'1', NULL)
INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he17', NULL, NULL, N'1', NULL)
GO



ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([Cid])
REFERENCES [dbo].[Category] ([CID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO

ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Book1] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Book1]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Student1] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Student1]
GO
ALTER TABLE [dbo].[Librarian]  WITH CHECK ADD  CONSTRAINT [FK_Librarian_Account] FOREIGN KEY([AccountName])
REFERENCES [dbo].[Account] ([AccountName])
GO
ALTER TABLE [dbo].[Librarian] CHECK CONSTRAINT [FK_Librarian_Account]
GO

ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Account] FOREIGN KEY([AccountName])
REFERENCES [dbo].[Account] ([AccountName])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Account]
GO
USE [master]
GO
ALTER DATABASE [SWP] SET  READ_WRITE 
GO
