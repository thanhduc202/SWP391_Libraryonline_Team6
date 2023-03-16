USE [master]
GO
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'SWP')
BEGIN
	ALTER DATABASE [SWP] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [SWP] SET ONLINE;
	DROP DATABASE [SWP];
END
GO


USE [SWP]
GO
/****** Object:  Database [SWP]    Script Date: 3/15/2023 3:16:26 PM ******/
CREATE DATABASE [SWP]

ALTER DATABASE [SWP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP] SET  MULTI_USER 
GO
ALTER DATABASE [SWP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP', N'ON'
GO
ALTER DATABASE [SWP] SET QUERY_STORE = OFF
GO
USE [SWP]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/15/2023 3:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Announcement]    Script Date: 3/15/2023 3:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announcement](
	[AnnouncementID] [int] IDENTITY(1,1) NOT NULL,
	[LibrarianID] [nvarchar](50) NOT NULL,
	[PublishDate] [date] NULL,
	[Title] [nvarchar](255) NULL,
	[Note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AnnouncementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 3/15/2023 3:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Bname] [nvarchar](50) NULL,
	[Author] [nvarchar](80) NULL,
	[image] [nvarchar](300) NULL,
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
/****** Object:  Table [dbo].[Category]    Script Date: 3/15/2023 3:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CID] [int] NOT NULL,
	[CName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 3/15/2023 3:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[StudentID] [nvarchar](50) NOT NULL,
	[BookID] [int] NOT NULL,
	[Content] [nvarchar](200) NULL,
	[Star] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Librarian]    Script Date: 3/15/2023 3:16:26 PM ******/
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
/****** Object:  Table [dbo].[Method]    Script Date: 3/15/2023 3:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Method](
	[MethodID] [int] IDENTITY(1,1) NOT NULL,
	[MethodName] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/15/2023 3:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [nvarchar](80) NOT NULL,
	[MethodID] [int] NULL,
	[LibrarianID] [nvarchar](50) Default 'L111',
	[OrderDate] [date] NULL,
	[ScheduledTime] [date] NULL,
	[StatusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/15/2023 3:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[ReceivedOn] [nvarchar](255) NULL,
	[ReturnOn] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penalty]    Script Date: 3/15/2023 3:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penalty](
	[PenaltyID] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [nvarchar](80) NULL,
	[OrderID] [int] NULL,
	[Amount] [money] NULL,
	[StatusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PenaltyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Renewal]    Script Date: 3/15/2023 3:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Renewal](
	[RenewalID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[LibrarianID] [nvarchar](50) Default 'L111',
	[ExtendDate] [date] NULL,
	[Reason] [nvarchar](max) NULL,
	[StatusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RenewalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 3/15/2023 3:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/15/2023 3:16:26 PM ******/
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
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [AccountName], [AccountPassword], [FullName], [Gender], [PhoneNumber], [Status], [AccessLevel]) VALUES (1, N'chung@fpt.edu.vn', N'123', N'do van chung', 1, 123123123, 1, 1)
INSERT [dbo].[Account] ([AccountID], [AccountName], [AccountPassword], [FullName], [Gender], [PhoneNumber], [Status], [AccessLevel]) VALUES (9, N'chungdvhe160136@fpt.edu.vn', N'123', N'Do Van Chung', 1, 123123123, 1, 1)
INSERT [dbo].[Account] ([AccountID], [AccountName], [AccountPassword], [FullName], [Gender], [PhoneNumber], [Status], [AccessLevel]) VALUES (10, N'duy@fpt.edu.vn', N'123', N'Ong Hoang Duy', 0, 123123123, 1, 2)
INSERT [dbo].[Account] ([AccountID], [AccountName], [AccountPassword], [FullName], [Gender], [PhoneNumber], [Status], [AccessLevel]) VALUES (2, N'hoang@fpt.edu.vn', N'123', N'hoang', 1, 123123123, 1, 2)
INSERT [dbo].[Account] ([AccountID], [AccountName], [AccountPassword], [FullName], [Gender], [PhoneNumber], [Status], [AccessLevel]) VALUES (3, N'linh@fpt.edu.vn', N'123', N'linh', 0, 123123123, 1, 1)
INSERT [dbo].[Account] ([AccountID], [AccountName], [AccountPassword], [FullName], [Gender], [PhoneNumber], [Status], [AccessLevel]) VALUES (4, N'long@gmail.com', N'123', N'long', 1, 924364599, 1, 1)
INSERT [dbo].[Account] ([AccountID], [AccountName], [AccountPassword], [FullName], [Gender], [PhoneNumber], [Status], [AccessLevel]) VALUES (5, N'nam@fpt.edu.vn', N'123', N'nam', 1, 957684600, 1, 1)
INSERT [dbo].[Account] ([AccountID], [AccountName], [AccountPassword], [FullName], [Gender], [PhoneNumber], [Status], [AccessLevel]) VALUES (8, N'phuongnam3@fpt.edu.vn', N'123', N'namper', 0, 387919614, 0, 3)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Announcement] ON 

INSERT [dbo].[Announcement] ([AnnouncementID], [LibrarianID], [PublishDate], [Title], [Note]) VALUES (1, N'L111', CAST(N'2023-03-11' AS Date), N'test1', N'test1')
INSERT [dbo].[Announcement] ([AnnouncementID], [LibrarianID], [PublishDate], [Title], [Note]) VALUES (2, N'L111', CAST(N'2023-03-11' AS Date), N'test2', N'test2')
INSERT [dbo].[Announcement] ([AnnouncementID], [LibrarianID], [PublishDate], [Title], [Note]) VALUES (3, N'L111', CAST(N'2023-03-11' AS Date), N'test3', N'test3')
SET IDENTITY_INSERT [dbo].[Announcement] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (1, N'Lazy diary', N'joe burn', N'img/Lazy diary.jpg', 1, N'English', N'the dramitic stoy about a child', 1, 10, N'open book', 2020, 200)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (2, N'firebase', N'adam rotch', N'img', 11, N'other', N'aaa', 1, 10, N'bod', 2020, 200)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (3, N'Software Engineering at Google: Lessons Learned', N'Titus Winters', N'img/Software Engineering at Google.jpg', 3, N'English', N'Today, software engineers need to know not only how to program effectively but also how to develop proper engineering practices to make their codebase sustainable AND healthy. This book emphasizes this difference BETWEEN programming AND software engineering. How can software engineers manage a living codebase that evolves AND responds to changing requirements AND demands over the length of its life? Based ON their experience at Google, software engineers Titus Winters AND Hyrum Wright, along WITH technical writer Tom Manshreck, present a candid AND insightful look at how some of the world’s leading practitioners construct AND maintain software. This book covers Google’s unique engineering culture, processes, AND tools AND how these aspects contribute to the effectiveness of an engineering organization.', 0, 50, N'O′Reilly', 2020, 300)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (4, N'Fundamentals of Software Architecture', N'Neal Ford, 
Mark Richards', N'img/Fundamentals of Software Architecture.jpg', 4, N'English', N'Salary surveys worldwide regularly place software architect IN the top 10 best jobs, yet no real guide exists to help developers become architects. Until now. This book provides the first comprehensive overview of software architecture’s many aspects. Aspiring AND existing architects alike will examine architectural characteristics, architectural patterns, component determination, diagramming AND presenting architecture, evolutionary architecture, AND many other topics.', 0, 70, N'O''Reilly ', 2020, 300)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (5, N'Python Crash Course, 2nd Edition', N'Eric Matthes', N'img/Python Crash Course, 2nd Edition.jpg', 5, N'English', N'Python Crash Course is the world''''s best-selling guide to the Python programming language. This fast-paced, thorough introduction to programming WITH Python will have you writing programs, solving problems, AND making things that work IN no time.', 1, 20, N' No Starch Press', 2019, 450)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (6, N'Blockchain Bubble or Revolution', N'Neel Mehta, 
Aditya Agashe', N'img/Blockchain Bubble or Revolution.jpg', 6, N'English', N'Authored by Silicon Valley leaders FROM Google, Microsoft, AND Facebook, Bubble or Revolution cuts through the hype to offer a balanced, comprehensive, AND accessible analysis of blockchains AND cryptocurrencies.', NULL, 50, N'Paravane Ventures', 2019, 310)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (7, N'Expert Python Programming: Master Python', N'Michal Jaworski, Tarek Ziadé', N'img/Expert Python Programming.jpg', 7, N'English', N'The book will start by taking you through the new features IN Python 3.7. You''''ll THEN learn the advanced components of Python syntax, IN addition to understanding how to apply concepts of various programming paradigms, including object-oriented programming, functional programming, AND event-driven programming. This book will also guide you through learning the best naming practices, writing your own distributable Python packages, AND getting up to speed WITH automated ways of deploying your software ON remote servers. You''''ll discover how to CREATE useful Python extensions WITH C, C++, Cython, AND CFFI. Furthermore, studying about code management tools, writing clear documentation, AND exploring test-driven development will help you write clean code.', NULL, 50, N'Packt Publishing', 2021, 400)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (8, N'DEKIRU NIHONGO BEGINNER1', N'Kazukoshimada', N'img/dekiru-nihongo-1-beginner-s-level-main-textbook.jpg', 2, N'English', N'Dekiru Nihongo Beginner focuses on practicing and building vocabulary through examples based on everyday life. The goal is to build your Japanese skills so they can be used in real life situations. Each chapter introduces a topic with an illustrated situation. The illustrations guide you on how to form  sentences to match the situation shown. The ideal response is then presented with further challenges to change the information. such as a new date or location to ask for. Listening exercises are also available lei each topic on the included 3 CDs along with word lists for eacn chapter.', NULL, 50, N' BONJINSHA', 2020, 300)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (9, N'The Road to React: Your Journey to Master', N'Robin Wieruch', N'img/The Road to React.png', 1, N'English', N'In ', 1, 50, N'Independently published', 2020, 260)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (10, N'JavaScript AND JQuery', N'Jon Duckett,Jack Moore', N'img/JavaScript AND JQuery.jpg', 8, N'English', N'By the end of the book, not only will you be able to use the thousands of scripts, JavaScript APIs, AND jQuery plugins that are freely available ON the web, AND be able to customize them - you will also be able to CREATE your own scripts FROM scratch.', NULL, 50, N'Wiley', 2020, 350)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (11, N'PHP & MySQL: Server-side Web Development', N'Jon Duckett', N'img/PHP & MySQL.jpg', 8, N'English', N'This full-color book is packed WITH inspiring code examples, infographics AND photography that not only teach you the PHP language AND how to work WITH databases, but also show you how to build new applications FROM scratch.', NULL, 50, N'Wiley', 2020, 400)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (12, N'Mobile Development WITH .NET', N'Kwimbee', N'img/Mobile Development WITH .NET.jpg', 8, N'English', N'Quisque ligula lorem, dictum vitae ante in, pretium finibus ante. Sed sem mauris, convallis eget lectus non, vestibulum pharetra felis. Vivamus a metus neque. Duis sed est lorem. Duis imperdiet eu nisl vulputate scelerisque. Donec ut ligula neque. Proin nunc augue, pharetra quis vulputate quis, finibus a orci. Sed rutrum dapibus mattis. ', NULL, 50, N'Kwimbee', 2020, 200)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (13, N'Computer Organization And
Architecture', N'
William Stallings', N'img/Computer Organization And.jpg', 8, N'English', N'Four-time winner of the best Computer Science and Engineering textbook of the year award from the Textbook and Academic Authors Association, Computer Organization and Architecture: Designing for Performance provides a thorough discussion of the fundamentals of computer organization and architecture, covering not just processor design, but memory, I/O and parallel systems. Coverage is supported by a wealth of concrete examples emphasizing modern systems.', NULL, 50, N'Pearson', 2009, 200)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (14, N'Foundations of Programming', N'Michael R. Garey, John C. Mitchell, Albert Meyer', N'img/Foundations of Programming.jpg', 8, N'English', N'Written for advanced undergraduate and beginning graduate students, Foundations for Programming Languages uses a series of typed lambda calculi to study the axiomatic, operational, and denotational semantics of sequential programming languages. Later chapters are devoted to progressively more sophisticated type systems. Compared to other texts on the subject, Foundations for Programming Languages is distinguished primarily by its inclusion of material on universal algebra and algebraic data types, imperative languages and Floyd-Hoare logic, and advanced chapters on polymorphism and modules, subtyping and object-oriented concepts, and type inference. The book is mathematically oriented but includes discussion, motivation, and examples that make the material accessible to students specializing in software systems, theoretical computer science, or mathematical logic. Foundations for Programming Languages is suitable as a reference for professionals concerned with programming languages, software validation or verification, and programming, including those working with software modules or object-oriented programming.Foundations of Computing series', NULL, 50, N'The MIT Press', 1996, 250)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (15, N'Learning Web Design', N'Jennifer Niederst Robbins', N'img/Learning Web Design.jpg', 8, N'English', N'Do you want to build web pages but have no prior experience? This friendly guide is the perfect place to start. You’ll begin at square one, learning how the web and web pages work, and then steadily build from there. By the end of the book, you’ll have the skills to create a simple site with multicolumn pages that adapt for mobile devices.', NULL, 50, N'O''Reilly', 2018, 350)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (16, N'Learn C Programming', N'Jeff Szuhay', N'img/Learn C Programming.jpg', 8, N'English', N'The book takes you through basic programming concepts and shows you how to implement them in the C programming language. Throughout the book, you''ll create and run programs that demonstrate essential C concepts, such as program structure with functions, control structures such as loops and conditional statements, and complex data structures. As you make progress, you''ll get to grips with in-code documentation, testing, and validation methods. This new edition expands upon the use of enumerations, arrays, and additional C features, and provides two working programs based on the code used in the book. What''s more, this book uses the method of intentional failure, where you''ll develop a working program and then purposely break it to see what happens, thereby learning how to recognize possible mistakes when they happen.', NULL, 50, N'Packt Publishing', 2022, 300)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (17, N'I Love You to the Moon and Back', N'Amelia Hepworth', N'img/I Love You to the Moon and Back.jpg', 9, N'English', N'When the sun comes up, Big Bear and Little Bear think of new ways to share their love. Big Bear loves Little Bear more and more as each day passes, right up to each new moon – and back.    A joyful celebration of the love between parent and child, this lovely chunky board book is perfect for reading with your special little person. With sturdy pages that are easy for little hands to turn and beautiful illustrations by Tim Warnes, I Love You to the Moon and Back will soon become a firm bedtime favourite.', NULL, 50, N'Tiger Tales', 2015, 200)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (18, N'Goodnight Moon', N'Margaret Wise Brown', N'img/Goodnight Moon.jpg', 9, N'English', N'In a great green room, tucked away in bed, is a little bunny. "Goodnight room, goodnight moon." And to all the familiar things in the softly lit room—to the picture of the three little bears sitting on chairs, to the clocks and his socks, to the mittens and the kittens, to everything one by one—the little bunny says goodnight.', NULL, 50, N'HarperFestival', 2007, 200)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (19, N'Software Architecture', N'
Mark Richards, Neal Ford', N'img/Software Architecture.jpg', 8, N'English', N'Architecture veterans and practicing consultants Neal Ford, Mark Richards, Pramod Sadalage, and Zhamak Dehghani discuss strategies for choosing an appropriate architecture. By interweaving a story about a fictional group of technology professionals--the Sysops Squad--they examine everything from how to determine service granularity, manage workflows and orchestration, manage and decouple contracts, and manage distributed transactions to how to optimize operational characteristics, such as scalability, elasticity, and performance.', NULL, 50, N'O''Reilly', 2021, 350)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (20, N'Clean Code: A Handbook of Agile Software', N'
Dean Wampler, 
Robert C. Martin', N'img/Clean Code.jpg', 8, N'English', N'Noted software expert Robert C. Martin, presents a revolutionary paradigm with Clean Code: A Handbook of Agile Software Craftsmanship. Martin, who has helped bring agile principles from a practitioner’s point of view to tens of thousands of programmers, has teamed up with his colleagues from Object Mentor to distill their best agile practice of cleaning code “on the fly” into a book that will instill within you the values of software craftsman, and make you a better programmer―but only if you work at it.', NULL, 50, N'Pearson', 2008, 300)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (21, N'ASP.NET Core in Action', N'Andrew Lock
', N'img/ASP.NET Core in Action.jpg', 8, N'English', N'ASP.NET Core in Action opens up the world of cross-platform web development with .NET. You''ll start with a crash course in .NET Core, immediately cutting the cord between ASP.NET and Windows. Then, you''ll begin to build amazing web applications step by step, systematically adding essential features like logins, configuration, dependency injection, and custom components. Along the way, you''ll mix in important process steps like testing, multiplatform deployment, and security.', NULL, 50, N'Manning', 2018, 300)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (22, N'To the Ends of the Earth', N'ULF', N'img/To the Ends of the Earth.jpg', 3, N' English', N'In To the Ends of the Earth: Building a National MissionarySending Structure, Dr. Arto Hämäläinen and Dr. Ulf Strohbehnprovide a framework for building a national mission structure, basedon many years of effective high-level leadership on the platform of aSpirit-filled collaborative community worldwide.', 1, 10, N'Asia Pacific Theological Seminary Press ', 2020, 126)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (23, N'Awaken to Your True Self', N'Andrew Daniel', N'img/Awaken to Your True Self.jpg', 5, N' English', N'Why You''re Still Stuck and How to Break Through', 1, 10, N'MetaHeal', 2022, 432)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (25, N'Conscious Breathing', N'Anders Olsson', N'img/Conscious Breathing.jpg', 5, N' English', N'Discover The Power of Your Breath Paperback', 1, 10, N'Sorena AB', 2014, 265)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (26, N'The Breathing Cure', N'Patrick McKeown ', N'img/8The Breathing Cure.jpg', 7, N' English', N'Develop New Habits for a Healthier, Happier, and Longer Life', 1, 10, N'Humanix Books', 2021, 434)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (27, N'Sleep Wrecked Kids', N'Sharon Moore', N'img/Sleep Wrecked Kids.jpg', 9, N' English', N'Helping Parents Raise Happy, Healthy Kids, One Sleep at a Time ', 1, 10, N'Morgan James Publishing', 2019, 234)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (28, N'Raising an Anxious Child', N' Erika Miller', N'img/Raising an Anxious Child.jpg', 10, N' English', N'Practical Strategies Every Parent Must Know to Raise Happy and Confident Children Without Overparenting', 1, 10, N'Independently published', 2021, 195)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (29, N'Why Smart Kids Worry', N'Allison Edwards ', N'img/Why Smart Kids Worry.jpg', 9, N' English', N'nd What Parents Can Do to Help (15 Tools for Parenting Your Anxious Child)', 1, 10, N'Sourcebooks ', 2013, 256)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (30, N'How To Tame My Anxiety Monster', N'Melanie Hawkins', N'img/How To Tame My Anxiety Monster.jpg', 8, N' English', N'Do you have an anxiety monster that is big, and wild, and likes to visit you? Is there any way to tame him? Can he be a helpful monster that you just might not mind having around? ', 1, 10, N'Inspire Joy Publishing', 2020, 38)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (32, N'The All Purpose Knots Bible', N' Conrad Fowler ', N'img/The All Purpose Knots Bible.jpg', 3, N' English', N'The Step-by-Step Illustrated Guide to Learn How to Tying 150 Vital Knots for All Needs | For Camping, Hunting & Bushcraft Included', 1, 10, N'Independently published', 2023, 168)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (33, N'Cirrhosis Cookbook', N'Marvin Sidwell', N'img/Cirrhosis Cookbook.jpg', 4, N'English', N'The Liver Healing Diet Meal Recipes to Reverse Fatty Liver Disease, Heal Immune System & Eliminate Toxins to Promote Overall Health', 1, 10, N'Independently published', 2020, 83)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (34, N'The Exceptions', N'Kate Zernike', N'img/The Exceptions.jpg', 6, N' English', N'Nancy Hopkins, MIT, and the Fight for Women in Science', 1, 10, N'Scribner ', 2023, 432)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (35, N'The Little Book of Incredibly Useful Knots', N'Geoffrey Budworth', N'img/The Little Book of Incredibly Useful Knots.jpg', 3, N' English', N'200 Practical Knots for Sailors, Climbers, Campers & Other Adventurers', 1, 10, N'Skyhorse ', 2016, 320)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (36, N'The New Design Rules', N'Emily Henderson', N'img/The New Design Rules.jpg', 7, N' English', N'How to Decorate and Renovate, from Start to Finish: An Interior Design Book', 1, 10, N'Clarkson Potter; Illustrated edition ', 2022, 336)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (37, N'The Survival Medicine Handbook', N'Joseph Alton MD', N'img/The Survival Medicine Handbook.jpg', 8, N' English', N'The Essential Guide for When Help is NOT on the Way', 1, 10, N' Doom and Bloom, LLC; 4th edition', 2021, 694)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (38, N'The Road to React', N'Robin Wieruch', N'img/The Road to React.png', 8, N' English', N'The React.js with Hooks in JavaScript Book', 1, 10, N'Independently published', 2017, 394)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (39, N'Wood Gasifier Builder''s Bible', N' Ben Peterson', N'img/Wood Gasifier Builder''s Bible.jpg', 10, N' English', N'Off Grid Fuel for the Prepared Homestead: Wood Gas in Minutes ', 1, 10, N'Independently published', 2020, 341)
INSERT [dbo].[Book] ([BookID], [Bname], [Author], [image], [Cid], [Language], [Description], [Status], [quantity], [publisher], [publishYear], [pages]) VALUES (40, N'Where There Is No Dentist', N'Murray Dickson ', N'img/Where There Is No Dentist.jpg', 9, N' English', N'This 2021 updated reprint features information on Atraumatic Restorative Treatment (ART), a way to fill cavities without the use of a dental drill, as well as updated information on other training material and resources. This book is an important companion to Hesperian''s classic book Where There Is No Doctor. All Hesperian books are regularly updated and reprinted to reflect accurate medical information.', 1, 10, N'Hesperian Health Guides', 2021, 248)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
INSERT [dbo].[Category] ([CID], [CName]) VALUES (1, N'Science')
INSERT [dbo].[Category] ([CID], [CName]) VALUES (2, N'Foreign language')
INSERT [dbo].[Category] ([CID], [CName]) VALUES (3, N'Psychology')
INSERT [dbo].[Category] ([CID], [CName]) VALUES (4, N'cookbook')
INSERT [dbo].[Category] ([CID], [CName]) VALUES (5, N'Life style')
INSERT [dbo].[Category] ([CID], [CName]) VALUES (6, N'History')
INSERT [dbo].[Category] ([CID], [CName]) VALUES (7, N'Mystery')
INSERT [dbo].[Category] ([CID], [CName]) VALUES (8, N'Programing')
INSERT [dbo].[Category] ([CID], [CName]) VALUES (9, N'Storybook')
INSERT [dbo].[Category] ([CID], [CName]) VALUES (10, N'Major')
INSERT [dbo].[Category] ([CID], [CName]) VALUES (11, N'Other')
GO
INSERT [dbo].[FeedBack] ([StudentID], [BookID], [Content], [Star], [Date]) VALUES (N'he11', 1, N'Good', 4, CAST(N'2222-02-02' AS Date))
INSERT [dbo].[FeedBack] ([StudentID], [BookID], [Content], [Star], [Date]) VALUES (N'he11', 9, N'aaaaaaaaaaaaaa', 1, CAST(N'2023-03-05' AS Date))
INSERT [dbo].[FeedBack] ([StudentID], [BookID], [Content], [Star], [Date]) VALUES (N'he11', 33, N'on', 2, CAST(N'2019-09-09' AS Date))
INSERT [dbo].[FeedBack] ([StudentID], [BookID], [Content], [Star], [Date]) VALUES (N'he13', 3, N'Oke', 3, CAST(N'2020-10-10' AS Date))
INSERT [dbo].[FeedBack] ([StudentID], [BookID], [Content], [Star], [Date]) VALUES (N'he14', 1, N'Fpt1', 3, CAST(N'2021-09-29' AS Date))
INSERT [dbo].[FeedBack] ([StudentID], [BookID], [Content], [Star], [Date]) VALUES (N'he14', 29, N'oke', 4, CAST(N'2023-01-01' AS Date))
INSERT [dbo].[FeedBack] ([StudentID], [BookID], [Content], [Star], [Date]) VALUES (N'he15', 2, N'hihi', 5, CAST(N'2023-02-10' AS Date))
INSERT [dbo].[FeedBack] ([StudentID], [BookID], [Content], [Star], [Date]) VALUES (N'he15', 8, N'aaaaaaaaaaaaaaaaaaaaaaaaaaa', 1, CAST(N'1900-01-01' AS Date))
GO
INSERT [dbo].[Librarian] ([LibrarianID], [AccountName], [Shift], [Note]) VALUES (N'L111', N'hoang@fpt.edu.vn', N'1', NULL)
INSERT [dbo].[Librarian] ([LibrarianID], [AccountName], [Shift], [Note]) VALUES (N'L222', N'duy@fpt.edu.vn', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Method] ON 

INSERT [dbo].[Method] ([MethodID], [MethodName]) VALUES (1, N'Direct')
INSERT [dbo].[Method] ([MethodID], [MethodName]) VALUES (2, N'Delivery')
SET IDENTITY_INSERT [dbo].[Method] OFF
GO


INSERT [dbo].[Order] ( [AccountName], [MethodID], [LibrarianID], [OrderDate], [ScheduledTime], [StatusID]) VALUES ( N'nam@fpt.edu.vn', 1, N'L111', CAST(N'2023-02-23' AS Date), CAST(N'2023-11-11' AS Date), 1)
INSERT [dbo].[Order] ( [AccountName], [MethodID], [LibrarianID], [OrderDate], [ScheduledTime], [StatusID]) VALUES ( N'long@gmail.com', 2, N'L111', CAST(N'2023-02-23' AS Date), CAST(N'2023-03-11' AS Date), 1)
INSERT [dbo].[Order] ( [AccountName], [MethodID], [LibrarianID], [OrderDate], [ScheduledTime], [StatusID]) VALUES ( N'chung@fpt.edu.vn', NULL, NULL, CAST(N'1900-01-01' AS Date), NULL, 1)
INSERT [dbo].[Order] ( [AccountName], [MethodID], [LibrarianID], [OrderDate], [ScheduledTime], [StatusID]) VALUES ( N'chungdvhe160136@fpt.edu.vn', NULL, NULL, CAST(N'2023-03-05' AS Date), NULL, 1)
INSERT [dbo].[Order] ( [AccountName], [MethodID], [LibrarianID], [OrderDate], [ScheduledTime], [StatusID]) VALUES ( N'chungdvhe160136@fpt.edu.vn', NULL, NULL, CAST(N'2023-03-15' AS Date), NULL, 1)

GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [BookID], [ReceivedOn], [ReturnOn]) VALUES (1, 1, 1, NULL, NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [BookID], [ReceivedOn], [ReturnOn]) VALUES (2, 2, 2, NULL, NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [BookID], [ReceivedOn], [ReturnOn]) VALUES (4, 4, 9, NULL, NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [BookID], [ReceivedOn], [ReturnOn]) VALUES (6, 6, 8, NULL, NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [BookID], [ReceivedOn], [ReturnOn]) VALUES (7, 7, 8, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Penalty] ON 

INSERT [dbo].[Penalty] ([PenaltyID], [AccountName], [OrderID], [Amount], [StatusID]) VALUES (1, N'nam@gmail.com', 2, 20.0000, 7)
INSERT [dbo].[Penalty] ([PenaltyID], [AccountName], [OrderID], [Amount], [StatusID]) VALUES (2, N'long@gmail.com', 1, 20.0000, 7)
SET IDENTITY_INSERT [dbo].[Penalty] OFF
GO

SET IDENTITY_INSERT [dbo].[Renewal] ON 
INSERT [dbo].[Renewal] ([RenewalID], [OrderID], [LibrarianID], [ExtendDate], [Reason], [StatusID]) VALUES (1, 1, N'L111', CAST(N'2023-02-27' AS Date), N'sdfghdhfghfđfg', 1)
INSERT [dbo].[Renewal] ([RenewalID], [OrderID], [LibrarianID], [ExtendDate], [Reason], [StatusID]) VALUES (2, 2, N'L111', CAST(N'2023-04-30' AS Date), N'dfghdfghdfg', 2)
SET IDENTITY_INSERT [dbo].[Renewal] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [statusName]) VALUES (1, N'Pending')
INSERT [dbo].[Status] ([StatusID], [statusName]) VALUES (2, N'Approved')
INSERT [dbo].[Status] ([StatusID], [statusName]) VALUES (3, N'Closed')
INSERT [dbo].[Status] ([StatusID], [statusName]) VALUES (4, N'Overdue')
INSERT [dbo].[Status] ([StatusID], [statusName]) VALUES (5, N'Received')
INSERT [dbo].[Status] ([StatusID], [statusName]) VALUES (6, N'Paid')
INSERT [dbo].[Status] ([StatusID], [statusName]) VALUES (7, N'Unpaid')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he11', N'chung@fpt.edu.vn', 1, N'1', NULL)
INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he12', N'linh@fpt.edu.vn', 2, N'1', NULL)
INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he13', N'nam@fpt.edu.vn', 1, N'1', NULL)
INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he14', N'long@gmail.com', 1, N'1', NULL)
INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he15', N'chungdvhe160136@fpt.edu.vn', 1, N'1', NULL)
INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he16', NULL, 1, N'1', NULL)
INSERT [dbo].[Student] ([StudentID], [AccountName], [Semsester], [Major], [note]) VALUES (N'he17', NULL, NULL, N'1', NULL)
GO
ALTER TABLE [dbo].[Announcement] ADD  DEFAULT (getdate()) FOR [PublishDate]
GO

ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Penalty] ADD  DEFAULT ((7)) FOR [StatusID]
GO

ALTER TABLE [dbo].[Announcement]  WITH CHECK ADD FOREIGN KEY([LibrarianID])
REFERENCES [dbo].[Librarian] ([LibrarianID])
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
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__AccountNa__3B75D760] FOREIGN KEY([AccountName])
REFERENCES [dbo].[Account] ([AccountName])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__AccountNa__3B75D760]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([LibrarianID])
REFERENCES [dbo].[Librarian] ([LibrarianID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([MethodID])
REFERENCES [dbo].[Method] ([MethodID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Penalty]  WITH CHECK ADD  CONSTRAINT [FK__Penalty__Account__44FF419A] FOREIGN KEY([AccountName])
REFERENCES [dbo].[Account] ([AccountName])
GO
ALTER TABLE [dbo].[Penalty] CHECK CONSTRAINT [FK__Penalty__Account__44FF419A]
GO
ALTER TABLE [dbo].[Penalty]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Penalty]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Renewal]  WITH CHECK ADD FOREIGN KEY([LibrarianID])
REFERENCES [dbo].[Librarian] ([LibrarianID])
GO
ALTER TABLE [dbo].[Renewal]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Renewal]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
USE [master]
GO
ALTER DATABASE [SWP] SET  READ_WRITE 
GO
