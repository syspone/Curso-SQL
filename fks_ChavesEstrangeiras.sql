-- Tumas x Alunos
alter table Turmas
    add constraint fk_TurmasAlunos foreign key (id_aluno) references Alunos (id_alunos);

-- Turmas x Cursos
alter table Turmas
    add constraint fk_TurmasCursos foreign key (id_curso) references Cursos (id_curso);

-- Registro.Pres x Turmas
alter table Registro_Presenca
    ADD CONSTRAINT fk_RPTurmas foreign key (id_turma) references Turmas (id_turma);

-- Registro.Pres x Alunos
alter table Registro_Presenca
    ADD CONSTRAINT fk_RPAlunos foreign key (id_aluno) references Alunos (id_alunos);

-- Registro.Pres x Situacao
alter table Registro_Presenca
    ADD CONSTRAINT fk_RPSituacao foreign key (id_situacao) references Situacao (id_situacao);
