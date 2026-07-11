# Como conectar um repositório já existente do GitHub à sua máquina local

Guia de referência para o caso em que **o repositório já existe no GitHub**
(com algum conteúdo, como um `README.md`) e você quer ligá-lo a uma pasta local
que já existe na sua máquina. Foi o caso feito aqui com o `syspone/Curso-SQL`.

> **Dica:** se o repositório do GitHub estiver **vazio** (sem nenhum arquivo),
> o processo é mais simples — pule direto para a seção
> [Repositório remoto vazio](#atalho-repositório-remoto-vazio).

---

## Pré-requisitos

- **Git** instalado (`git --version`).
- Autenticação com o GitHub configurada. Aqui usamos o **GitHub CLI**:
  ```bash
  gh auth status        # confere se está logado
  gh auth login         # caso ainda não esteja
  ```

---

## Passo a passo (repositório remoto COM conteúdo)

### 1. Entre na pasta local do projeto
```bash
cd /home/cmsouza/DataGripProjects/DBA
```

### 2. Inicialize o Git (se ainda não for um repositório)
```bash
git init
```
Se a pasta já tiver sido inicializada, o Git avisa e nada é perdido.

### 3. Conecte o repositório remoto (adicione o `origin`)
`origin` é o apelido padrão para o endereço do seu repositório no GitHub.
```bash
git remote add origin https://github.com/syspone/Curso-SQL.git
```
Confira:
```bash
git remote -v
```

### 4. Baixe as informações do remoto
```bash
git fetch origin
```
Isso descobre os branches que existem no GitHub (ex.: `main`) **sem** alterar
seus arquivos ainda.

### 5. Vá para o branch principal do remoto
O GitHub cria repositórios novos com o branch chamado **`main`** (o Git antigo
usava `master`). Este comando cria um branch local `main` já ligado ao remoto e
traz os arquivos que estavam no GitHub (ex.: o `README.md`):
```bash
git checkout main
```
Depois dele, `git branch -vv` deve mostrar `main` rastreando `origin/main`.

### 6. (Opcional) Ignore arquivos que não devem ir para o repositório
Crie um arquivo `.gitignore`. Exemplo usado neste projeto:
```gitignore
# IDEs JetBrains (DataGrip, PyCharm, etc.)
.idea/

# Arquivos de sistema
.DS_Store
Thumbs.db
```

### 7. Envie seus arquivos locais para o GitHub
```bash
git add .                       # ou liste arquivos específicos
git commit -m "Mensagem descritiva"
git push
```

Pronto! A partir daqui o fluxo do dia a dia é `git add` → `git commit` → `git push`.

---

## Atalho: repositório remoto VAZIO

Se o repositório no GitHub **não tem nenhum arquivo**, não há nada para baixar.
Basta empurrar o seu conteúdo local:
```bash
cd /caminho/do/projeto
git init
git remote add origin https://github.com/USUARIO/REPO.git
git add .
git commit -m "Primeiro commit"
git branch -M main            # renomeia o branch atual para 'main'
git push -u origin main       # -u liga o branch local ao remoto (só na 1ª vez)
```

---

## Comandos úteis para conferir tudo

| Comando | O que mostra |
|---|---|
| `git remote -v` | Endereço(s) do repositório remoto |
| `git branch -vv` | Branches locais e qual remoto cada um rastreia |
| `git status` | Arquivos modificados / não monitorados |
| `git log --oneline` | Histórico de commits |

---

## Problemas comuns

- **`fatal: remote origin already exists`**
  Já existe um `origin`. Para trocar o endereço:
  ```bash
  git remote set-url origin https://github.com/USUARIO/REPO.git
  ```

- **`Updates were rejected` no `push`**
  O GitHub tem commits que você não tem localmente. Traga-os primeiro:
  ```bash
  git pull origin main --rebase
  git push
  ```

- **Branch local é `master` mas o remoto é `main`**
  Foi exatamente o caso deste projeto. O `git checkout main` (passo 5) resolve,
  criando e usando o branch `main` correto.