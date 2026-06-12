-- CreateTable
CREATE TABLE `Alunos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `rm` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `serie` INTEGER NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Alunos_rm_key`(`rm`),
    UNIQUE INDEX `Alunos_email_key`(`email`),
    UNIQUE INDEX `Alunos_cpf_key`(`cpf`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Atividades` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `materia` VARCHAR(191) NOT NULL,
    `media` DOUBLE NOT NULL,
    `tarefas` VARCHAR(191) NOT NULL,
    `provas` VARCHAR(191) NOT NULL,
    `alunoId` INTEGER NOT NULL,
    `professorId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Coordenadores` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Coordenadores_email_key`(`email`),
    UNIQUE INDEX `Coordenadores_cpf_key`(`cpf`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Professores` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `telefone` VARCHAR(191) NOT NULL,
    `disciplina` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,
    `coordenadorId` INTEGER NOT NULL,

    UNIQUE INDEX `Professores_email_key`(`email`),
    UNIQUE INDEX `Professores_cpf_key`(`cpf`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Responsaveis` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `telefone` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,
    `alunoId` INTEGER NOT NULL,

    UNIQUE INDEX `Responsaveis_email_key`(`email`),
    UNIQUE INDEX `Responsaveis_cpf_key`(`cpf`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Atividades` ADD CONSTRAINT `Atividades_alunoId_fkey` FOREIGN KEY (`alunoId`) REFERENCES `Alunos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Atividades` ADD CONSTRAINT `Atividades_professorId_fkey` FOREIGN KEY (`professorId`) REFERENCES `Professores`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Professores` ADD CONSTRAINT `Professores_coordenadorId_fkey` FOREIGN KEY (`coordenadorId`) REFERENCES `Coordenadores`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Responsaveis` ADD CONSTRAINT `Responsaveis_alunoId_fkey` FOREIGN KEY (`alunoId`) REFERENCES `Alunos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
