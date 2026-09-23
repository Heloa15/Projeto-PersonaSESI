/*
  Warnings:

  - You are about to drop the column `nota` on the `atividades` table. All the data in the column will be lost.
  - Added the required column `materia` to the `Atividades` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `atividades` DROP COLUMN `nota`,
    ADD COLUMN `materia` VARCHAR(191) NOT NULL;
