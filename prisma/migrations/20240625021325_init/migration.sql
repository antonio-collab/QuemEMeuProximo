-- CreateTable
CREATE TABLE "Diretor" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Turma" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "diretorId" INTEGER NOT NULL,
    CONSTRAINT "Turma_diretorId_fkey" FOREIGN KEY ("diretorId") REFERENCES "Diretor" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Aluno" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "diretorId" INTEGER NOT NULL,
    CONSTRAINT "Aluno_diretorId_fkey" FOREIGN KEY ("diretorId") REFERENCES "Diretor" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Professor" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Disciplina" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "diretorId" INTEGER NOT NULL,
    CONSTRAINT "Disciplina_diretorId_fkey" FOREIGN KEY ("diretorId") REFERENCES "Diretor" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_AlunoToTurma" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_AlunoToTurma_A_fkey" FOREIGN KEY ("A") REFERENCES "Aluno" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_AlunoToTurma_B_fkey" FOREIGN KEY ("B") REFERENCES "Turma" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_ProfessorToTurma" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_ProfessorToTurma_A_fkey" FOREIGN KEY ("A") REFERENCES "Professor" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_ProfessorToTurma_B_fkey" FOREIGN KEY ("B") REFERENCES "Turma" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_DisciplinaToTurma" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_DisciplinaToTurma_A_fkey" FOREIGN KEY ("A") REFERENCES "Disciplina" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_DisciplinaToTurma_B_fkey" FOREIGN KEY ("B") REFERENCES "Turma" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "_AlunoToTurma_AB_unique" ON "_AlunoToTurma"("A", "B");

-- CreateIndex
CREATE INDEX "_AlunoToTurma_B_index" ON "_AlunoToTurma"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ProfessorToTurma_AB_unique" ON "_ProfessorToTurma"("A", "B");

-- CreateIndex
CREATE INDEX "_ProfessorToTurma_B_index" ON "_ProfessorToTurma"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_DisciplinaToTurma_AB_unique" ON "_DisciplinaToTurma"("A", "B");

-- CreateIndex
CREATE INDEX "_DisciplinaToTurma_B_index" ON "_DisciplinaToTurma"("B");
