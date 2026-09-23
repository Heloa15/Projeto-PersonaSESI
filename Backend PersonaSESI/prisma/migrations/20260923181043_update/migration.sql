-- CreateTable
CREATE TABLE `Responsaveis` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `telefone` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `cpf` VARCHAR(191) NOT NULL,
    `senha` VARCHAR(191) NOT NULL,
    `alunoId` INTEGER NOT NULL,

    UNIQUE INDEX `Responsaveis_email_key`(`email`),
    UNIQUE INDEX `Responsaveis_cpf_key`(`cpf`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Responsaveis` ADD CONSTRAINT `Responsaveis_alunoId_fkey` FOREIGN KEY (`alunoId`) REFERENCES `Alunos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
