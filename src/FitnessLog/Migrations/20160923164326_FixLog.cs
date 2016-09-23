using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

namespace FitnessLog.Migrations
{
    public partial class FixLog : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Log_AspNetUsers_ApplicationUserId",
                table: "Log");

            migrationBuilder.DropIndex(
                name: "IX_Log_ApplicationUserId",
                table: "Log");

            migrationBuilder.DropColumn(
                name: "ApplicationUserId",
                table: "Log");

            migrationBuilder.AddColumn<string>(
                name: "UserId",
                table: "Log",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Log_UserId",
                table: "Log",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Log_AspNetUsers_UserId",
                table: "Log",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Log_AspNetUsers_UserId",
                table: "Log");

            migrationBuilder.DropIndex(
                name: "IX_Log_UserId",
                table: "Log");

            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Log");

            migrationBuilder.AddColumn<string>(
                name: "ApplicationUserId",
                table: "Log",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Log_ApplicationUserId",
                table: "Log",
                column: "ApplicationUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_Log_AspNetUsers_ApplicationUserId",
                table: "Log",
                column: "ApplicationUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
