using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FitnessLog.Migrations
{
    public partial class MoreStuff : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_EntryExerciseJoin_Log_EntryId",
                table: "EntryExerciseJoin");

            migrationBuilder.DropForeignKey(
                name: "FK_EntryExerciseJoin_Exercises_ExerciseId",
                table: "EntryExerciseJoin");

            migrationBuilder.DropPrimaryKey(
                name: "PK_EntryExerciseJoin",
                table: "EntryExerciseJoin");

            migrationBuilder.AddPrimaryKey(
                name: "PK_EntryExerciseJoins",
                table: "EntryExerciseJoin",
                column: "JoinId");

            migrationBuilder.AddForeignKey(
                name: "FK_EntryExerciseJoins_Log_EntryId",
                table: "EntryExerciseJoin",
                column: "EntryId",
                principalTable: "Log",
                principalColumn: "EntryId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_EntryExerciseJoins_Exercises_ExerciseId",
                table: "EntryExerciseJoin",
                column: "ExerciseId",
                principalTable: "Exercises",
                principalColumn: "ExerciseId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.RenameIndex(
                name: "IX_EntryExerciseJoin_ExerciseId",
                table: "EntryExerciseJoin",
                newName: "IX_EntryExerciseJoins_ExerciseId");

            migrationBuilder.RenameIndex(
                name: "IX_EntryExerciseJoin_EntryId",
                table: "EntryExerciseJoin",
                newName: "IX_EntryExerciseJoins_EntryId");

            migrationBuilder.RenameTable(
                name: "EntryExerciseJoin",
                newName: "EntryExerciseJoins");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_EntryExerciseJoins_Log_EntryId",
                table: "EntryExerciseJoins");

            migrationBuilder.DropForeignKey(
                name: "FK_EntryExerciseJoins_Exercises_ExerciseId",
                table: "EntryExerciseJoins");

            migrationBuilder.DropPrimaryKey(
                name: "PK_EntryExerciseJoins",
                table: "EntryExerciseJoins");

            migrationBuilder.AddPrimaryKey(
                name: "PK_EntryExerciseJoin",
                table: "EntryExerciseJoins",
                column: "JoinId");

            migrationBuilder.AddForeignKey(
                name: "FK_EntryExerciseJoin_Log_EntryId",
                table: "EntryExerciseJoins",
                column: "EntryId",
                principalTable: "Log",
                principalColumn: "EntryId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_EntryExerciseJoin_Exercises_ExerciseId",
                table: "EntryExerciseJoins",
                column: "ExerciseId",
                principalTable: "Exercises",
                principalColumn: "ExerciseId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.RenameIndex(
                name: "IX_EntryExerciseJoins_ExerciseId",
                table: "EntryExerciseJoins",
                newName: "IX_EntryExerciseJoin_ExerciseId");

            migrationBuilder.RenameIndex(
                name: "IX_EntryExerciseJoins_EntryId",
                table: "EntryExerciseJoins",
                newName: "IX_EntryExerciseJoin_EntryId");

            migrationBuilder.RenameTable(
                name: "EntryExerciseJoins",
                newName: "EntryExerciseJoin");
        }
    }
}
