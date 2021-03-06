USE [master]
GO
/****** Object:  Database [FitnessLog]    Script Date: 10/6/2016 4:11:13 PM ******/
CREATE DATABASE [FitnessLog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FitnessLog', FILENAME = N'C:\Users\epicodus\FitnessLog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FitnessLog_log', FILENAME = N'C:\Users\epicodus\FitnessLog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FitnessLog] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FitnessLog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FitnessLog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FitnessLog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FitnessLog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FitnessLog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FitnessLog] SET ARITHABORT OFF 
GO
ALTER DATABASE [FitnessLog] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FitnessLog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FitnessLog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FitnessLog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FitnessLog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FitnessLog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FitnessLog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FitnessLog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FitnessLog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FitnessLog] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FitnessLog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FitnessLog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FitnessLog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FitnessLog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FitnessLog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FitnessLog] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FitnessLog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FitnessLog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FitnessLog] SET  MULTI_USER 
GO
ALTER DATABASE [FitnessLog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FitnessLog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FitnessLog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FitnessLog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FitnessLog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FitnessLog] SET QUERY_STORE = OFF
GO
USE [FitnessLog]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FitnessLog]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/6/2016 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 10/6/2016 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/6/2016 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/6/2016 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/6/2016 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/6/2016 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/6/2016 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Age] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[Gender] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[Weight] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 10/6/2016 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EntryExerciseJoins]    Script Date: 10/6/2016 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntryExerciseJoins](
	[JoinId] [int] IDENTITY(1,1) NOT NULL,
	[EntryId] [int] NOT NULL,
	[ExerciseId] [int] NOT NULL,
	[Reps] [int] NOT NULL,
	[Sets] [int] NOT NULL,
	[Weight] [int] NOT NULL,
 CONSTRAINT [PK_EntryExerciseJoins] PRIMARY KEY CLUSTERED 
(
	[JoinId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exercises]    Script Date: 10/6/2016 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exercises](
	[ExerciseId] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Exercises] PRIMARY KEY CLUSTERED 
(
	[ExerciseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 10/6/2016 4:11:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[EntryId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[EntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160909172330_Initial', N'1.0.0-rtm-21431')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160911232247_Exercises', N'1.0.0-rtm-21431')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160916162721_IntegrateIdentity', N'1.0.0-rtm-21431')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160923164326_FixLog', N'1.0.0-rtm-21431')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20161004164349_MoreStuff', N'1.0.0-rtm-21431')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [Age], [ConcurrencyStamp], [Email], [EmailConfirmed], [Gender], [Height], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [Weight]) VALUES (N'7999cada-c4fe-488e-a022-f68f7bcfa023', 0, 22, N'f9c0cf9e-911f-4c92-b356-a3272005e5ff', NULL, 0, 0, 71, 1, NULL, NULL, N'BROSEPHUS.BROTHOLOMEW', N'AQAAAAEAACcQAAAAEFzK4R5yWEnw2UbnDB0Y+UA2+p0CX2OVViA6jW2H8dsTqTk8bmt/0eRu/W5u1dPwUA==', NULL, 0, N'540bcbb8-3e29-4257-9b10-a9d402652a39', 0, N'Brosephus.Brotholomew', 171)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [Age], [ConcurrencyStamp], [Email], [EmailConfirmed], [Gender], [Height], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [Weight]) VALUES (N'946dab08-bfeb-468d-a84a-362c62cba70a', 0, 33, N'31b4b4a5-6d8b-45e3-8620-e13d6da792e8', NULL, 0, 1, 63, 1, NULL, NULL, N'JENNIFER.THOMPSON', N'AQAAAAEAACcQAAAAEPS8hGFAVYC265SJNAVlIVvD58du52r05QkeczIOs4EhE3nRvBBV4oVcQ+4l/9tG6w==', NULL, 0, N'68cf58f5-e605-4688-94fa-840a41381a99', 0, N'Jennifer.Thompson', 132)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [Age], [ConcurrencyStamp], [Email], [EmailConfirmed], [Gender], [Height], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [Weight]) VALUES (N'9a8a0c20-430c-412b-a337-d4c93050a8d8', 0, 26, N'703518fd-458d-4a27-8ecd-3fe9fbe99338', NULL, 0, 0, 74, 1, NULL, NULL, N'CHARLIE@EXAMPLE', N'AQAAAAEAACcQAAAAEAVYhqUG9Y9wMC49tZpO9+nmVnRKFFy6xXH/VC2QGI7GBjAh582rV7fw7CX/45gP0g==', NULL, 0, N'234cb6a5-6270-4ea1-a96e-1ad1c0812356', 0, N'Charlie@example', 205)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [Age], [ConcurrencyStamp], [Email], [EmailConfirmed], [Gender], [Height], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [Weight]) VALUES (N'a7f7e4e9-b54f-44a9-9f4f-1c6ad2786bcd', 0, 29, N'96c7b5f9-ef75-435b-83b9-673bbaf1117a', NULL, 0, 2, 66, 1, NULL, NULL, N'SAMPLE.OLYMPIC', N'AQAAAAEAACcQAAAAEEGYS4bp/9RE+dXzbql4aS6q5mGxfbgyRHZj6GpCKidApRn19oh613VDYyPCHzHwcA==', NULL, 0, N'5eb79e74-cedf-49d9-8b46-760c05619eaa', 0, N'Sample.Olympic', 168)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [Age], [ConcurrencyStamp], [Email], [EmailConfirmed], [Gender], [Height], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [Weight]) VALUES (N'd218f7bb-d332-44dc-8fc7-200100bb5d67', 0, 26, N'e3d11a97-4cb5-4500-8427-d515dfd49a9c', NULL, 0, 0, 74, 1, NULL, NULL, N'CHARLES.EWEL', N'AQAAAAEAACcQAAAAEMEmxQcE7zaqzSR2jrOiQj1ECCrBa7a9aaUX62sbrprkkK5YHYK5jgVi2oPBcxuTQQ==', NULL, 0, N'dcea7f84-8086-4678-abcd-8d1a649d2507', 0, N'Charles.Ewel', 198)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [Age], [ConcurrencyStamp], [Email], [EmailConfirmed], [Gender], [Height], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [Weight]) VALUES (N'fe6f7af7-7acb-48b9-b524-831853749946', 0, 41, N'fc343f53-d622-474c-ace2-c497985eb102', NULL, 0, 1, 68, 1, NULL, NULL, N'MOAR.SAMPLES', N'AQAAAAEAACcQAAAAEAtzZrwiPg8F6NGvrDQQ61gI5BeQcLfYUKvsjQLjI25zJZBj09hSfTgSnjz+UescKw==', NULL, 0, N'667f2c8c-70c6-494d-a5d9-646ce7765d1a', 0, N'Moar.Samples', 156)
SET IDENTITY_INSERT [dbo].[EntryExerciseJoins] ON 

INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (1, 1, 1, 5, 3, 175)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (2, 1, 9, 5, 3, 82)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (3, 1, 4, 5, 1, 245)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (4, 2, 1, 2, 1, 190)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (5, 2, 1, 5, 2, 165)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (6, 2, 7, 5, 3, 145)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (7, 2, 5, 3, 5, 80)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (8, 3, 1, 5, 3, 185)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (9, 3, 9, 5, 3, 80)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (10, 3, 4, 5, 3, 235)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (11, 4, 1, 5, 3, 355)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (12, 4, 7, 5, 5, 255)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (13, 4, 6, 5, 5, 25)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (14, 5, 7, 3, 3, 225)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (15, 5, 6, 10, 3, 0)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (16, 6, 13, 10, 3, 70)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (17, 6, 10, 10, 3, 0)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (18, 7, 3, 10, 3, 0)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (19, 7, 12, 5, 3, 70)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (20, 7, 6, 4, 3, 0)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (21, 8, 8, 8, 3, 95)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (22, 8, 13, 8, 3, 70)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (23, 8, 12, 8, 3, 70)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (24, 9, 1, 5, 3, 115)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (25, 9, 7, 5, 3, 95)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (26, 9, 7, 5, 3, 0)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (27, 10, 15, 3, 5, 145)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (28, 10, 2, 5, 3, 205)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (29, 10, 9, 5, 3, 115)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (30, 11, 14, 3, 5, 205)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (31, 11, 3, 10, 3, 0)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (32, 11, 10, 10, 3, 0)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (33, 12, 10, 10, 3, 0)
INSERT [dbo].[EntryExerciseJoins] ([JoinId], [EntryId], [ExerciseId], [Reps], [Sets], [Weight]) VALUES (34, 12, 5, 3, 5, 80)
SET IDENTITY_INSERT [dbo].[EntryExerciseJoins] OFF
SET IDENTITY_INSERT [dbo].[Exercises] ON 

INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (1, N'Legs', N'Low-Bar Back Squat')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (2, N'Legs', N'Front Squat')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (3, N'Legs', N'Glute Ham Raise')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (4, N'Back', N'Deadlift')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (5, N'Back', N'Power Clean')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (6, N'Back', N'Pull Ups')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (7, N'Chest', N'Flat Bench')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (8, N'Chest', N'Incline Bench')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (9, N'Shoulders', N'Overhead Press')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (10, N'Arms', N'Dips')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (11, N'Arms', N'Close Grip Bench')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (12, N'Arms', N'Tricep Pullovers')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (13, N'Arms', N'Bicep Curls')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (14, N'Olympic', N'Clean and Jerk')
INSERT [dbo].[Exercises] ([ExerciseId], [Category], [Name]) VALUES (15, N'Olympic', N'Snatch')
SET IDENTITY_INSERT [dbo].[Exercises] OFF
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([EntryId], [Date], [Description], [UserId]) VALUES (1, CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), N'Squats and Press went good, DL a little rushed', N'd218f7bb-d332-44dc-8fc7-200100bb5d67')
INSERT [dbo].[Log] ([EntryId], [Date], [Description], [UserId]) VALUES (2, CAST(N'2016-10-01T00:00:00.0000000' AS DateTime2), N'Deloaded Squats to Improve Form. Bench and PC went well', N'd218f7bb-d332-44dc-8fc7-200100bb5d67')
INSERT [dbo].[Log] ([EntryId], [Date], [Description], [UserId]) VALUES (3, CAST(N'2016-09-29T00:00:00.0000000' AS DateTime2), N'Squats Looked Dicey', N'd218f7bb-d332-44dc-8fc7-200100bb5d67')
INSERT [dbo].[Log] ([EntryId], [Date], [Description], [UserId]) VALUES (4, CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), N'Speed Bench', N'946dab08-bfeb-468d-a84a-362c62cba70a')
INSERT [dbo].[Log] ([EntryId], [Date], [Description], [UserId]) VALUES (5, CAST(N'2016-10-05T00:00:00.0000000' AS DateTime2), N'Get that Pump', N'7999cada-c4fe-488e-a022-f68f7bcfa023')
INSERT [dbo].[Log] ([EntryId], [Date], [Description], [UserId]) VALUES (6, CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), N'Arm Pump!', N'7999cada-c4fe-488e-a022-f68f7bcfa023')
INSERT [dbo].[Log] ([EntryId], [Date], [Description], [UserId]) VALUES (7, CAST(N'2016-10-05T00:00:00.0000000' AS DateTime2), N'Did some stuff', N'fe6f7af7-7acb-48b9-b524-831853749946')
INSERT [dbo].[Log] ([EntryId], [Date], [Description], [UserId]) VALUES (8, CAST(N'2016-09-30T00:00:00.0000000' AS DateTime2), N'Weekend Pump', N'7999cada-c4fe-488e-a022-f68f7bcfa023')
INSERT [dbo].[Log] ([EntryId], [Date], [Description], [UserId]) VALUES (9, CAST(N'2016-10-03T00:00:00.0000000' AS DateTime2), N'Still more stuff', N'fe6f7af7-7acb-48b9-b524-831853749946')
INSERT [dbo].[Log] ([EntryId], [Date], [Description], [UserId]) VALUES (10, CAST(N'2016-10-04T00:00:00.0000000' AS DateTime2), N'Snatch Day', N'a7f7e4e9-b54f-44a9-9f4f-1c6ad2786bcd')
INSERT [dbo].[Log] ([EntryId], [Date], [Description], [UserId]) VALUES (11, CAST(N'2016-10-01T00:00:00.0000000' AS DateTime2), N'Clean and Jerk Day', N'a7f7e4e9-b54f-44a9-9f4f-1c6ad2786bcd')
INSERT [dbo].[Log] ([EntryId], [Date], [Description], [UserId]) VALUES (12, CAST(N'2016-10-04T00:00:00.0000000' AS DateTime2), N'It went good', N'9a8a0c20-430c-412b-a337-d4c93050a8d8')
SET IDENTITY_INSERT [dbo].[Log] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 10/6/2016 4:11:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/6/2016 4:11:13 PM ******/
CREATE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 10/6/2016 4:11:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 10/6/2016 4:11:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 10/6/2016 4:11:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_UserId]    Script Date: 10/6/2016 4:11:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 10/6/2016 4:11:13 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/6/2016 4:11:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EntryExerciseJoins_EntryId]    Script Date: 10/6/2016 4:11:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_EntryExerciseJoins_EntryId] ON [dbo].[EntryExerciseJoins]
(
	[EntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EntryExerciseJoins_ExerciseId]    Script Date: 10/6/2016 4:11:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_EntryExerciseJoins_ExerciseId] ON [dbo].[EntryExerciseJoins]
(
	[ExerciseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Log_UserId]    Script Date: 10/6/2016 4:11:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Log_UserId] ON [dbo].[Log]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[EntryExerciseJoins]  WITH CHECK ADD  CONSTRAINT [FK_EntryExerciseJoins_Exercises_ExerciseId] FOREIGN KEY([ExerciseId])
REFERENCES [dbo].[Exercises] ([ExerciseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EntryExerciseJoins] CHECK CONSTRAINT [FK_EntryExerciseJoins_Exercises_ExerciseId]
GO
ALTER TABLE [dbo].[EntryExerciseJoins]  WITH CHECK ADD  CONSTRAINT [FK_EntryExerciseJoins_Log_EntryId] FOREIGN KEY([EntryId])
REFERENCES [dbo].[Log] ([EntryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EntryExerciseJoins] CHECK CONSTRAINT [FK_EntryExerciseJoins_Log_EntryId]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [FitnessLog] SET  READ_WRITE 
GO
