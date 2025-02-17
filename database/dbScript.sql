USE [master]
GO
/****** Object:  Database [Project]    Script Date: 11/11/2020 11:22:29 AM ******/
CREATE DATABASE [Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project] SET RECOVERY FULL 
GO
ALTER DATABASE [Project] SET  MULTI_USER 
GO
ALTER DATABASE [Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project', N'ON'
GO
ALTER DATABASE [Project] SET QUERY_STORE = OFF
GO
USE [Project]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/11/2020 11:22:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 11/11/2020 11:22:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NULL,
	[Answer] [varchar](500) NULL,
	[GuestId] [int] NULL,
	[QuestionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 11/11/2020 11:22:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 11/11/2020 11:22:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NULL,
	[Question] [varchar](5000) NULL,
	[Required] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 11/11/2020 11:22:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccId] [int] NULL,
	[Title] [varchar](200) NULL,
	[Detail] [varchar](500) NULL,
	[Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Email], [Password]) VALUES (1, N'nguyencuong0408@gmail.com', N'0691285f587675f62cb186ec8bccdd92')
INSERT [dbo].[Account] ([Id], [Email], [Password]) VALUES (2, N'cuongnmhe140724@fpt.edu.vn', N'd937ab3166ffecc312296be6990206a2')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (1, 1, N'Thanh', 11, 1)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (2, 1, N'20', 11, 2)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (3, 1, N'FPT', 11, 3)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (4, 1, N'Thanh', 12, 1)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (5, 1, N'20', 12, 2)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (6, 1, N'FPT', 12, 3)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (7, 1, N'Hien', 13, 1)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (8, 1, N'21', 13, 2)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (9, 1, N'FPT University', 13, 3)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (10, 1, N'Kien', 14, 1)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (11, 1, N'Teacher', 14, 2)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (12, 1, N'FPT University', 14, 3)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (13, 1, N'c', 14, 12)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (14, 1, N'Thanh', 15, 1)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (15, 1, N'Student', 15, 2)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (16, 1, N'FPT University', 15, 3)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (17, 1, N'c', 15, 12)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (18, 2, N'Software engineer', 16, 16)
INSERT [dbo].[Answer] ([Id], [SurveyId], [Answer], [GuestId], [QuestionId]) VALUES (19, 2, N'Not yet', 16, 17)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
SET IDENTITY_INSERT [dbo].[Guest] ON 

INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (1, N'cuong')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (2, N'cuong')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (3, N'cuong')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (4, N'cuong')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (5, N'cuong')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (6, N'cuong')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (7, N'cuong')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (8, N'cuong')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (9, N'cuong')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (10, N'cuong')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (11, N'cuong')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (12, N'cuong')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (13, N'Hien')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (14, N'Kien')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (15, N'Thanh')
INSERT [dbo].[Guest] ([Id], [NAME]) VALUES (16, N'Kien')
SET IDENTITY_INSERT [dbo].[Guest] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Id], [SurveyId], [Question], [Required]) VALUES (1, 1, N'What you name?', 1)
INSERT [dbo].[Question] ([Id], [SurveyId], [Question], [Required]) VALUES (2, 1, N'<p>What are you doing?</p>', 1)
INSERT [dbo].[Question] ([Id], [SurveyId], [Question], [Required]) VALUES (3, 1, N'<p>What is your school?</p>', 1)
INSERT [dbo].[Question] ([Id], [SurveyId], [Question], [Required]) VALUES (12, 1, N'<p>What is your talent?</p>
<p>A.SIng</p>
<p>B.Dance</p>
<p>C.Nothing</p>', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [Question], [Required]) VALUES (13, 16, N'<p>Good and clarified call quality&nbsp;</p>
<p>(1-Disagree, 2-Neutral, 3-Agree)</p>', 1)
INSERT [dbo].[Question] ([Id], [SurveyId], [Question], [Required]) VALUES (14, 16, N'<p>Network is not blocked, broken circuit, works well 24/24</p>
<p>(1-Disagree, 2-Neutral, 3-Agree)</p>', 1)
INSERT [dbo].[Question] ([Id], [SurveyId], [Question], [Required]) VALUES (15, 16, N'<p>Price is acceptable</p>
<p>(1-Disagree, 2-Neutral, 3-Agree)</p>', 0)
INSERT [dbo].[Question] ([Id], [SurveyId], [Question], [Required]) VALUES (16, 2, N'<p>What is your major?</p>', 1)
INSERT [dbo].[Question] ([Id], [SurveyId], [Question], [Required]) VALUES (17, 2, N'<p>Have you studied online yet?</p>', 0)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Survey] ON 

INSERT [dbo].[Survey] ([Id], [AccId], [Title], [Detail], [Status]) VALUES (1, 1, N'New Student', N'Information of new Student', N'Running')
INSERT [dbo].[Survey] ([Id], [AccId], [Title], [Detail], [Status]) VALUES (2, 1, N'Online learning', N'Something about online learning', N'Running')
INSERT [dbo].[Survey] ([Id], [AccId], [Title], [Detail], [Status]) VALUES (5, 2, N'Fond-End', N'Interview', N'Pending')
INSERT [dbo].[Survey] ([Id], [AccId], [Title], [Detail], [Status]) VALUES (13, 1, N'Peer-graded Assignment: Scaling Up', N'hshahah', N'Pending')
INSERT [dbo].[Survey] ([Id], [AccId], [Title], [Detail], [Status]) VALUES (14, 1, N'New term feedback', N'<p>Feedback</p>', N'Pending')
INSERT [dbo].[Survey] ([Id], [AccId], [Title], [Detail], [Status]) VALUES (16, 2, N'Questionnaire of Vinaphone customer satisfaction ', N'<p>This is a survey about your opinion in perception on real experience from mobile telephony service.Â </p>', N'Running')
SET IDENTITY_INSERT [dbo].[Survey] OFF
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Guest] FOREIGN KEY([GuestId])
REFERENCES [dbo].[Guest] ([Id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Guest]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Survey] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Survey] ([Id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Survey]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Survey] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Survey] ([Id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Survey]
GO
ALTER TABLE [dbo].[Survey]  WITH CHECK ADD FOREIGN KEY([AccId])
REFERENCES [dbo].[Account] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Project] SET  READ_WRITE 
GO
