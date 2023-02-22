create database SWP

use SWP

Create table Account(
	AccountName nvarchar(80) not null Primary key,
	AccountPassword nvarchar(50),
	FullName nvarchar(50),
	Gender bit,
	PhoneNumber bigint,
	[Status] int,
	AccessLevel int 
)

Create table Librarian(
	LibrarianID nvarchar(50) primary key not null,
	AccountName nvarchar(80) foreign key references Account(AccountName) ,
	[Shift] nvarchar(50) ,
	Note nvarchar(50) 
)

Create table Announcement(
	announcementID int identity(1,1) primary key not null,
	LibrarianID nvarchar(50) foreign key references Librarian(LibrarianID),
	title nvarchar(150),
	content nvarchar(max),
	tag int,
	[Date] date
)

Create table Category(
	CID int primary key not null,
	CName nvarchar(50),
	Major nvarchar(50)
)

Create table Book(
	BookID int identity(1,1) primary key not null,
	Bname nvarchar(50),
	[image] nvarchar(300),
	Author nvarchar(80),
	Cid int foreign key references Category(CID) ,
	[Language] nvarchar(50),
	[Description] nvarchar(max) ,
	[Status] int ,
	quantity int ,
	publisher nvarchar(75)
)

Create table Student(
	StudentID nvarchar(50) primary key not null,
	AccountName nvarchar(80) foreign key references Account(AccountName) ,
	Semsester int ,
	Major nvarchar(50) ,
	note nvarchar(50) ,
)

Create table Borrow(
	BorrowID int identity(1,1) primary key not null,
	StudentID nvarchar(50) foreign key references Student(StudentID),
	LibrarianID nvarchar(50) foreign key references Librarian(LibrarianID),
	BookID int foreign key references Book(BookID) ,
	DataBorrow date ,
	Deadline date ,
	[status] int ,
)



Create table Feedback(
	StudentID nvarchar(50) foreign key references Student(StudentID) ,
	BookID int foreign key references Book(BookID),
	Content nvarchar(200),
	Star int ,
	[Date] date
)



Create table ListOrderBooks(
	OrderID int identity(1,1) primary key not null,
	StudentID nvarchar(50) foreign key references Student(StudentID),
	BookID int foreign key references Book(BookID)
)

/*Insert dữ liệu */
/*Insert account*/
INSERT INTO Account (AccountName, AccountPassword, FullName, Gender, PhoneNumber, [Status], AccessLevel)
VALUES (N'chung@gmail.com', N'123', N'do van chung', 1, 123123123, 1, 1)
INSERT INTO Account (AccountName, AccountPassword, FullName, Gender, PhoneNumber, [Status], AccessLevel)
VALUES (N'hoang@gmail.com', N'123', N'hoang', 1, 123123123, 1, 2)
INSERT INTO Account (AccountName, AccountPassword, FullName, Gender, PhoneNumber, [Status], AccessLevel)
VALUES (N'linh@gmail.com', N'123', N'linh', 0, 123123123, 1, 1)

/*Insert category*/
INSERT INTO Category(CID, CName, Major) VALUES (1, N'classic', NULL)
INSERT INTO Category(CID, CName, Major) VALUES (2, N'lifeStyle', NULL)
INSERT INTO Category(CID, CName, Major) VALUES (3, N'Trader', NULL)

/*Insert Librarian*/
INSERT Librarian(LibrarianID, AccountName, [Shift], Note) VALUES (N'he11', N'chung@gmail.com', N'1', NULL)
INSERT Librarian(LibrarianID, AccountName, [Shift], Note) VALUES (N'he12', N'linh@gmail.com', N'1', NULL)

/*Insert Book*/
INSERT INTO Book( Bname, [image], Author, Cid, [Language], [Description], [Status], quantity, publisher)
VALUES ( N'Lazy diary', NULL, N'joe burn', 1, N'english', N'the dramitic stoy about a child', 1, 19, N'open book')
INSERT INTO Book( Bname, [image], Author, Cid, [Language], [Description], [Status], quantity, publisher)
VALUES ( N'firebase', NULL, N'adam rotch', 2, N'other', N'aaa', 2, 2, N'bod')


