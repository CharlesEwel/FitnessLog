﻿using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using FitnessLog.Models;

namespace FitnessLog.Migrations
{
    [DbContext(typeof(FitnessLogDbContext))]
    partial class FitnessLogDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
            modelBuilder
                .HasAnnotation("ProductVersion", "1.0.0-rtm-21431")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("FitnessLog.Models.Entry", b =>
                {
                    b.Property<int>("EntryId")
                        .ValueGeneratedOnAdd();

                    b.Property<DateTime>("Date");

                    b.Property<string>("Description");

                    b.Property<int>("UserId");

                    b.HasKey("EntryId");

                    b.HasIndex("UserId");

                    b.ToTable("Log");
                });

            modelBuilder.Entity("FitnessLog.Models.EntryExerciseJoin", b =>
                {
                    b.Property<int>("JoinId")
                        .ValueGeneratedOnAdd();

                    b.Property<int>("EntryId");

                    b.Property<int>("ExerciseId");

                    b.Property<int>("Reps");

                    b.Property<int>("Sets");

                    b.Property<int>("Weight");

                    b.HasKey("JoinId");

                    b.HasIndex("EntryId");

                    b.HasIndex("ExerciseId");

                    b.ToTable("EntryExerciseJoin");
                });

            modelBuilder.Entity("FitnessLog.Models.Exercise", b =>
                {
                    b.Property<int>("ExerciseId")
                        .ValueGeneratedOnAdd();

                    b.Property<string>("Category");

                    b.Property<string>("Name");

                    b.HasKey("ExerciseId");

                    b.ToTable("Exercises");
                });

            modelBuilder.Entity("FitnessLog.Models.User", b =>
                {
                    b.Property<int>("UserId")
                        .ValueGeneratedOnAdd();

                    b.Property<int>("Age");

                    b.Property<int>("Gender");

                    b.Property<int>("Height");

                    b.Property<string>("UserName");

                    b.Property<int>("Weight");

                    b.HasKey("UserId");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("FitnessLog.Models.Entry", b =>
                {
                    b.HasOne("FitnessLog.Models.User", "User")
                        .WithMany("Log")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade);
                });

            modelBuilder.Entity("FitnessLog.Models.EntryExerciseJoin", b =>
                {
                    b.HasOne("FitnessLog.Models.Entry", "Entry")
                        .WithMany("EntryExerciseJoins")
                        .HasForeignKey("EntryId")
                        .OnDelete(DeleteBehavior.Cascade);

                    b.HasOne("FitnessLog.Models.Exercise", "Exercise")
                        .WithMany("EntryExerciseJoins")
                        .HasForeignKey("ExerciseId")
                        .OnDelete(DeleteBehavior.Cascade);
                });
        }
    }
}
