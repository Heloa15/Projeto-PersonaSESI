/*
  Warnings:

  - You are about to drop the column `materia` on the `atividades` table. All the data in the column will be lost.
  - You are about to drop the column `media` on the `atividades` table. All the data in the column will be lost.
  - You are about to drop the column `tarefas` on the `atividades` table. All the data in the column will be lost.
  - Added the required column `senha` to the `Alunos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dataEntrega` to the `Atividades` table without a default value. This is not possible if the table is not empty.
  - Added the required column `descricao` to the `Atividades` table without a default value. This is not possible if the table is not empty.
  - Added the required column `titulo` to the `Atividades` table without a default value. This is not possible if the table is not empty.
  - Added the required column `senha` to the `Coordenadores` table without a default value. This is not possible if the table is not empty.
  - Added the required column `senha` to the `Professores` table without a default value. This is not possible if the table is not empty.
  - Added the required column `senha` to the `Responsaveis` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `alunos` ADD COLUMN `senha` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `atividades` DROP COLUMN `materia`,
    DROP COLUMN `media`,
    DROP COLUMN `tarefas`,
    ADD COLUMN `dataEntrega` DATETIME(3) NOT NULL,
    ADD COLUMN `descricao` VARCHAR(191) NOT NULL,
    ADD COLUMN `nota` DOUBLE NULL,
    ADD COLUMN `titulo` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `coordenadores` ADD COLUMN `senha` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `professores` ADD COLUMN `senha` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `responsaveis` ADD COLUMN `senha` VARCHAR(191) NOT NULL;
