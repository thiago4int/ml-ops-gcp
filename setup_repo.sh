#!/bin/bash

# Cria a estrutura de pastas
mkdir -p mlops-gcp/{infra,src,scripts}

# Cria arquivos principais
touch mlops-gcp/infra/{main.tf,variables.tf,outputs.tf,providers.tf}
touch mlops-gcp/src/{train_model.py,redeploy_model.py,requirements.txt}
touch mlops-gcp/cloudbuild.yaml
touch mlops-gcp/scripts/setup_repo.sh
touch mlops-gcp/{README.md,.gitignore}

# Adiciona permissão de execução ao script
chmod +x mlops-gcp/scripts/setup_repo.sh

echo "Estrutura do repositório criada com sucesso!"